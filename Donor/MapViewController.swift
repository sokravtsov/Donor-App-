//
//  MapViewController.swift
//  Donor
//
//  Created by Sergey Kravtsov on 13.04.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var settingsButton: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        mapView.camera = camera
        mapView.isMyLocationEnabled = true
        
    }
    
    // MARK: - Actions
    
    @IBAction func buttonDidTouch(_ sender: UIButton) {
        self.performSegue(withIdentifier: Segue.toPickerVC, sender: self)
    }
}
