//
//  MapViewController.swift
//  Shiba Inu
//
//  Created by Olivia on 2017-10-05.
//  Copyright © 2017 Olivia. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
  
  // Variable
  let locationManager = CLLocationManager()
  @IBOutlet weak var mapView: MKMapView!
  
  // Functions
  override func viewDidLoad() {
    super.viewDidLoad()
    locationManager.delegate = self
    locationManager.requestAlwaysAuthorization()
  }
  
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    mapView.showsUserLocation = (status == .authorizedAlways)
  }
}


