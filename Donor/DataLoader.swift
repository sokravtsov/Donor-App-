//
//  DataLoader.swift
//  Donor
//
//  Created by Sergey Kravtsov on 17.04.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

let base = FIRDatabase.database().reference()

/// Networking class for sending and parsing data with Firebase
final class DataLoader {
    
    // MARK: - Variables

    static let shared = DataLoader()
    
    private var _refBase = base
    
    private var _refEvents = base.child("events")
    
    var refBase: FIRDatabaseReference {
        return _refBase
    }
    
    var refEvents: FIRDatabaseReference {
        return _refEvents
    }
    
    var mapVC: MapViewController!
    
    // MARK: - Methods
    
    /// Method for sending event to Firebase db
    func sendEventToFirebase(latitude: String, longitude: String, bloodGroup: String, date: String, description: String) {
        guard let uid = FIRAuth.auth()?.currentUser?.uid else {return}
        base.child("events").childByAutoId().setValue(["latitude": latitude,
                                                       "longitude": longitude,
                                                       "blood_group": bloodGroup,
                                                       "date": date,
                                                       "description": description,
                                                       "owner_id": uid])
    }
    
    func getEvents() {
        refEvents.observe(.value, with: { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshot {
                    if let eventDict = snap.value as? [String: AnyObject] {
                        let id = snap.key
                        let event = Event(eventID: id, eventData: eventDict)
                        Profile.shared.events.append(event)
                    }
                }
                print("marker added")
            }
        })
    }
}
