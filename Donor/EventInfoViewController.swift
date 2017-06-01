//
//  EventInfoViewController.swift
//  Donor
//
//  Created by Sergey Kravtsov on 20.04.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps
import Firebase

final class EventInfoViewController: BasicViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var bloodGroup: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    // MARK: - Variables
    
    var event: Event?
    
    var index: Int?
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let bloodGroupString = event?.bloodGroup, let date = event?.expiryDate,
            let descript = event?.description, let ownerID = event?.ownerID,
            let lat = event?.latitude, let lon = event?.longitude else { return }
        guard let uid = FIRAuth.auth()?.currentUser?.uid else {return}
        
        
        bloodGroup.text = "Required blood group \(bloodGroupString)"
        dateLabel.text = "Expiry date \(date)"
        descriptionTextView.text = descript
        if ownerID == uid {
            navBar.topItem?.title = "My Donation Event 🚑"
        } else {
            deleteButton.isEnabled = false
            deleteButton.tintColor = .clear
        }
        
        let camera = GMSCameraPosition.camera(withLatitude: Double(lat)!, longitude: Double(lon)!, zoom: 15)
        let position = CLLocationCoordinate2D(latitude: Double(lat)!, longitude: Double(lon)!)
        let marker = GMSMarker(position: position)
        performUIUpdatesOnMain {
            self.mapView.camera = camera
            marker.map = self.mapView
        }
    }
    
    // MARK: - Actions
    
    @IBAction func backButtonDidTouch(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteButtonDidTouch(_ sender: UIBarButtonItem) {
        guard let key = event?.eventID else { return }
        DataLoader.shared.deleteEventFromFirebase(key)
        Profile.shared.events.remove(at: index!)
        performUIUpdatesOnMain {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
