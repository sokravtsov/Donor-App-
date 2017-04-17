//
//  MapViewController.swift
//  Donor
//
//  Created by Sergey Kravtsov on 13.04.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var settingsButton: UIButton!
    
    // MARK: - Variables
    
    let locationManager = CLLocationManager()
    
    var latitude = ""
    
    var longitude = ""
    
    var eventViewController: EventViewController!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        
        CLLocationManager.authorizationStatus() != .authorizedWhenInUse ? locationManager.requestWhenInUseAuthorization() : locationManager.startUpdatingLocation()
        
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    
    // MARK: - Actions
    
    @IBAction func buttonDidTouch(_ sender: UIButton) {
        self.performSegue(withIdentifier: Segue.toPickerVC, sender: self)
    }
}

// MARK: - Extensions

// MARK: - CLLocationManagerDelegate
extension MapViewController {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            locationManager.stopUpdatingLocation()
            
        }
    }
}

// MARK: - didLongPressAt coordinate
extension MapViewController {
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
//        let marker = GMSMarker()
//        marker.position = coordinate
//        marker.title = "Hello World"
//        marker.snippet = "hahaha"
//        marker.appearAnimation = .pop
//        marker.map = mapView
        
        // TODO: - add coordinate to EventVC
        latitude = coordinate.latitude.description
        longitude = coordinate.longitude.description
        self.performSegue(withIdentifier: "createEvent", sender: self)
    }
}

extension MapViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createEvent" {
            let vc = segue.destination as! EventViewController
            self.eventViewController = vc
            vc.latitude = latitude
            vc.longitude = longitude
        }
    }
}
