//
//  Endroit.swift
//  MapPG
//
//  Created by vm mac on 18/03/2016.
//  Copyright © 2016 Casati-Vasseur. All rights reserved.
//

import UIKit
import MapKit

class Endroit: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate : CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    
    init(coordinate : CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }

    
}
