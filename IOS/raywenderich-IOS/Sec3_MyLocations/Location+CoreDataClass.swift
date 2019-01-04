//
//  Location+CoreDataClass.swift
//  Sec3_MyLocations
//
//  Created by Hyeontae on 30/12/2018.
//  Copyright © 2018 onemoon. All rights reserved.
//
//

import Foundation
import CoreData
import MapKit

@objc(Location)
// swift 만 사용하는 프로젝트는 상관없지만 objc 까지 사용하는 hybrid의 경우
// name mangling 에서 문제가 생길 수 있기 때문에 @objc(Location) 을 사용한다.
public class Location: NSManagedObject, MKAnnotation {
    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
    
    public var title: String? {
        if locationDescription.isEmpty {
            return "(No Description)"
        } else {
            return locationDescription
        }
    }
    
    public var subtitle: String? {
        return category
    }

}

