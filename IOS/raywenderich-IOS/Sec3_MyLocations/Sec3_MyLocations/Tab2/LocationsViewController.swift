//
//  LocationsViewController.swift
//  Sec3_MyLocations
//
//  Created by Hyeontae on 31/12/2018.
//  Copyright © 2018 onemoon. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation

class LocationsViewController: UITableViewController {
    
    var managedObjectContext: NSManagedObjectContext!
    var locations = [Location]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        let fetchRequest = NSFetchRequest<Location>()
        // 2
        let entity = Location.entity()
        fetchRequest.entity = entity
        // 3
        let sortDescriptor = NSSortDescriptor(key: "date",
                                              ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            // 4
            locations = try managedObjectContext.fetch(fetchRequest)
        } catch {
            fatalCoreDataError(error)
        }

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath)
        let descriptionLabel = cell.viewWithTag(100) as! UILabel
        descriptionLabel.text = "If you can see this"
        
        let addressLabel = cell.viewWithTag(101) as! UILabel
        addressLabel.text = "Then it works!"
        
        return cell
    }

    
    

}
