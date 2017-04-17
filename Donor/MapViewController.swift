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
    
    var latitude: String?
    
    var longitude: String?
    
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
        latitude = coordinate.latitude.description
        longitude = coordinate.longitude.description
        self.performSegue(withIdentifier: Segue.createEvent, sender: self)
    }
}

extension MapViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.createEvent {
            let vc = segue.destination as! EventViewController
            self.eventViewController = vc
            guard let unwrapLat = latitude else {return}
            guard let unwrapLon = longitude else {return}
            vc.latitude = unwrapLat
            vc.longitude = unwrapLon
        }
    }
}
