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

/// Variable for Firebase Reference 
let base = FIRDatabase.database().reference()

/// Networking class for sending and parsing data with Firebase
final class DataLoader {
    
    // MARK: - Variables

    static let shared = DataLoader()
    
    private var _refBase = base
    
    private var _refEvents = base.child(FirebaseHeader.events)
    
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
        base.child(FirebaseHeader.events).childByAutoId().setValue(["latitude": latitude,
                                                                    "longitude": longitude,
                                                                    "blood_group": bloodGroup,
                                                                    "date": date,
                                                                    "description": description,
                                                                    "owner_id": uid])
    }
    
    /// Method for deleting my event 
    func deleteEventFromFirebase(_ key: String) {
        refEvents.child(key).removeValue { (error, ref) in
            if error != nil {
                print("error in deleteEventFromFirebase")
            } else {
                print("Event is deleteted -------------")
            }
        }
    }
    
    /// Method for parsing events from Firebase db
    func getEvents() {
        if !Profile.shared.events.isEmpty {
            Profile.shared.events.removeAll()
        }
        
        refEvents.observe(.value, with: { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshot {
                    if let eventDict = snap.value as? [String: AnyObject] {
                        let id = snap.key
                        let event = Event(eventID: id, eventData: eventDict)
                        Profile.shared.events.append(event)
                    }
                }
            }
        })
    }
}
