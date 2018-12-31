//
//  FirstViewController.swift
//  Sec3_MyLocations
//
//  Created by Hyeontae on 22/12/2018.
//  Copyright © 2018 onemoon. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData

class CurrentLocationViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var tagButton: UIButton!
    @IBOutlet weak var getButton: UIButton!
    
    let locationManager = CLLocationManager()
    var managedObjectContext: NSManagedObjectContext!
    var location: CLLocation?
    var updatingLocation = false
    var lastLocationError: Error?
    // for reverse geocoding
    let geocoder = CLGeocoder()
    var placemark: CLPlacemark?
    var performingReverseGeocoding = false
    var lastGeocodingError: Error?
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    
    // MARK:- Actions
    @IBAction func getLocation() {
        
        // ask for authorization
        let authStatus = CLLocationManager.authorizationStatus()
        if authStatus == .notDetermined {
            // permission을 안물어봤을 때
            locationManager.requestWhenInUseAuthorization()
            return
        } else if authStatus == .denied || authStatus == .restricted {
            // permission에 문제가 있을 때
            showLocationServicesDeniedAlert()
            return
        }
        
        if updatingLocation {
            stopLocationManager()
        } else {
            location = nil
            lastLocationError = nil
            placemark = nil
            lastGeocodingError = nil
            startLocationManager()
        }
        
        updateLabels()
    }
    
    // start location manager
    func startLocationManager() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy =
            kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            updatingLocation = true
            
            // 60초 동안 반응이 없으면 중지 시켜야 한다.
            timer = Timer.scheduledTimer(
                timeInterval: 60, target: self,
                selector: #selector(didTimeOut),
                userInfo: nil, repeats: false)
        
        }
    }
    
    
    @objc func didTimeOut() {
        print("*** Time out")
        if location == nil {
            stopLocationManager()
            lastLocationError = NSError(
                domain: "MyLocationsErrorDomain",
                code: 1, userInfo: nil)
            updateLabels()
        }
    }
    
    
    // stop update
    func stopLocationManager() {
        if updatingLocation {
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            updatingLocation = false
            
            if let timer = timer {
                timer.invalidate()
            }
        }
    }
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error) {
        // error handler
        print("didFailWithError \(error.localizedDescription)")
        
        if (error as NSError).code == CLError.locationUnknown.rawValue {
            return
        }
        lastLocationError = error
        stopLocationManager()
        updateLabels()
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        // update location
        let newLocation = locations.last!
        print("didUpdateLocations \(newLocation)")
        
        // 1
        // 값을 가져오는데 5초 이상 걸릴경우 cache된 값을 주기 때문에 이는 제외한다.
        if newLocation.timestamp.timeIntervalSinceNow < -5 {
            return
        }
        
        // 2
        // horizontalAccuracy 값이 0보다 떨어지는 경우는 잘못된 값이므로 제외한다.
        if newLocation.horizontalAccuracy < 0 {
            return
        }
        
        // for real device
        var distance = CLLocationDistance(Double.greatestFiniteMagnitude)
        if let location = location {
            // 이전값이랑 얼마나 차이나는지 비교
            distance = newLocation.distance(from: location)
        }
        
        
        // 3
        if location == nil || location!.horizontalAccuracy > newLocation.horizontalAccuracy {
            // 처음에 값을 받지 않은 경우거나 이전에 받은 값보다 정확한 경우
            // horizontalAccuracy 가 높을수록 덜 정확하다
            
            // 4
            lastLocationError = nil
            location = newLocation
            
            // 5
            if newLocation.horizontalAccuracy <= locationManager.desiredAccuracy {
                // 현재 10으로 설정해놓았다. 이 값만큼 정확해졌을 때 location Manager를 중단시킨다.
                print("*** We're done!")
                stopLocationManager()
                
                if distance > 0 {
                    // for real device
                    performingReverseGeocoding = false
                } 
                
            }
            updateLabels()
            // reverse geocoding
            if !performingReverseGeocoding {
                print("*** Going to geocode")
                
                performingReverseGeocoding = true
                
                geocoder.reverseGeocodeLocation(newLocation, completionHandler: {
                    placemarks, error in
                    self.lastGeocodingError = error
                    if error == nil, let p = placemarks, !p.isEmpty {
                        // “if there’s no error and the unwrapped placemarks array is not empty”
                        self.placemark = p.last!
                    } else {
                        self.placemark = nil
                    }
                    
                    self.performingReverseGeocoding = false
                    self.updateLabels()

                })
            } else if distance < 1 {
                // for real device
                let timeInterval = newLocation.timestamp.timeIntervalSince(location!.timestamp)
                if timeInterval > 10 {
                    print("*** Force done!")
                    stopLocationManager()
                    updateLabels()
                }
                
            }
            
            
        }
    }
    
    func updateLabels() {
        if let location = location {
            latitudeLabel.text = String(format: "%.8f",
                                        location.coordinate.latitude)
            longitudeLabel.text = String(format: "%.8f",
                                         location.coordinate.longitude)
            tagButton.isHidden = false
            messageLabel.text = ""
            
            // reverse geocoding
            if let placemark = placemark {
                print(string(from: placemark))
                addressLabel.text = string(from: placemark)
            } else if performingReverseGeocoding {
                addressLabel.text = "Searching for Address..."
            } else if lastGeocodingError != nil {
                addressLabel.text = "Error Finding Address"
            } else {
                addressLabel.text = "No Address Found"
            }
            
        } else {
            messageLabel.text = "Tap 'Get My Location' to Start"
            
            let statusMessage: String
            if let error = lastLocationError as NSError? {
                if error.domain == kCLErrorDomain &&
                    error.code == CLError.denied.rawValue {
                    statusMessage = "Location Services Disabled"
                } else {
                    statusMessage = "Error Getting Location"
                }
            } else if !CLLocationManager.locationServicesEnabled() {
                statusMessage = "Location Services Disabled"
            } else if updatingLocation {
                statusMessage = "Searching..."
            } else {
                statusMessage = "Tap 'Get My Location' to Start"
            }
            messageLabel.text = statusMessage
        }
        configureGetButton()
    }
    
    // MARK:- Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TagLocation" {
            let controller = segue.destination as! LocationDetailViewController
            controller.coordinate = location!.coordinate
            controller.placemark = placemark
            controller.managedObjectContext = managedObjectContext
        }
    }
    
    

}

extension CurrentLocationViewController {
    
    // MARK:- Helper Methods
    func showLocationServicesDeniedAlert() {
        let alert = UIAlertController(
            title: "Location Services Disabled",
            message: "Please enable location services for this app in Settings.",
            preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default,
                                     handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    // get button text
    func configureGetButton() {
        if updatingLocation {
            getButton.setTitle("Stop", for: .normal)
        } else {
            getButton.setTitle("Get My Location", for: .normal)
        }
    }
    
}

extension CurrentLocationViewController {
    func string(from placemark: CLPlacemark) -> String {
        
        // 1
        var line1 = ""
        
        // 2
        if let s = placemark.subThoroughfare {
            line1 += s + " "
        }
        
        // 3
        if let s = placemark.thoroughfare {
            line1 += s
        }
        
        // 4
        var line2 = ""
        
        if let s = placemark.locality {
            line2 += s + " "
        }
        if let s = placemark.administrativeArea {
            line2 += s + " "
        }
        if let s = placemark.postalCode {
            line2 += s
        }
        
        // 5
        return line1 + "\n" + line2
    }

}
