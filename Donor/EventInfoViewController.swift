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
        
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    // MARK: - Variables
        
    var event: Event?
    
    var index: Int?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.title = LocalizedStrings.back.localized
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let bloodGroupString = event?.bloodGroup, let date = event?.expiryDate,
            let descript = event?.description, let ownerID = event?.ownerID,
            let lat = event?.latitude, let lon = event?.longitude else { return }
        
        guard let uid = FIRAuth.auth()?.currentUser?.uid else {return}
        
        bloodGroup.text = "\(LocalizedStrings.requiredBloodGroup.localized) \(bloodGroupString)"
        dateLabel.text = "\(LocalizedStrings.expiryDate.localized) \(date)"
        descriptionTextView.text = descript
        if ownerID == uid {
            self.navigationItem.title = LocalizedStrings.eventInfoVCTitle2.localized
        } else {
            self.navigationItem.title = LocalizedStrings.eventInfoVCTitle.localized
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
        showAlertForDelete()
    }
}

extension EventInfoViewController {
    func showAlertForDelete() {
        let alertController = UIAlertController(title: LocalizedStrings.deleteEventTitle.localized, message: "", preferredStyle: .alert)
        let delete = UIAlertAction(title: LocalizedStrings.delete.localized, style: .default) { (UIAlertAction) in
            guard let key = self.event?.eventID, let index = self.index else { return }
            DataLoader.shared.deleteEventFromFirebase(key)
            Profile.shared.events.remove(at: index)
            self.dismiss(animated: true, completion: nil)
        }
        let cancel = UIAlertAction(title: LocalizedStrings.cancel.localized, style: .cancel)
        alertController.addAction(delete)
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)
    }
}
