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

/// Networking class for sending and parsing data with Firebase
final class DataLoader {
    
    class var sharedInstance: DataLoader {
        return _sharedInstance
    }
    
    // MARK: - Variables
    
    /// Firebase db reference
    var ref: FIRDatabaseReference! = FIRDatabase.database().reference()
    
    // MARK: - Methods
    
    /// Method for sending event to Firebase db
    func sendEventToFirebase(latitude: String, longitude: String, bloodGroup: String, date: String, description: String) {
        guard let uid = FIRAuth.auth()?.currentUser?.uid else {return}
        self.ref.child("events").childByAutoId().setValue(["latitude": latitude,
                                                           "longitude": longitude,
                                                           "blood_group": bloodGroup,
                                                           "date": date,
                                                           "description": description,
                                                           "owner_id": uid])
    }
}
private let _sharedInstance = DataLoader()
