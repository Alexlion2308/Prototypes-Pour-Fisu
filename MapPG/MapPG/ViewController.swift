//
//  ViewController.swift
//  MapPG
//
//  Created by vm mac on 18/03/2016.
//  Copyright © 2016 Casati-Vasseur. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let myLocation : Endroit = Endroit(coordinate: CLLocationCoordinate2D(latitude: 39.792949, longitude: -89.6343448) , title: "Ici Springfield !", subtitle: "#Les Simpsons")
        let myRegion : MKCoordinateRegion = MKCoordinateRegion(center: (myLocation.coordinate), span: (MKCoordinateSpan(latitudeDelta: 0.1,longitudeDelta: 0.1)))
        myMapView.addAnnotation(myLocation)
        myMapView.centerCoordinate = myLocation.coordinate
        myMapView.setRegion(myRegion, animated: true)
    }

    @IBOutlet weak var myMapView: MKMapView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

