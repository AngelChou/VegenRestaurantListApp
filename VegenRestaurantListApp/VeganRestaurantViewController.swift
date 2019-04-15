//
//  VeganRestaurantViewController.swift
//  VegenRestaurantListApp
//
//  Created by Shun-Ching, Chou on 2019/4/15.
//  Copyright © 2019 Shun-Ching, Chou. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class VeganRestaurantViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var venue: Venue?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let venue = venue {
            let coordinate = CLLocationCoordinate2D(latitude: venue.location.lat, longitude: venue.location.lng)
            let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
            mapView.region = MKCoordinateRegion(center: coordinate, span: span)

            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = venue.name
            self.mapView.addAnnotation(annotation)
        }
    }
}
