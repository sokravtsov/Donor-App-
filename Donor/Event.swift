//
//  Event.swift
//  Donor
//
//  Created by Sergey Kravtsov on 17.04.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import Foundation

final class Event {
    
    var _bloodGroup: String!
    
    var _expiryDate: String!
    
    var _description: String!
    
    var _latitude: String!
    
    var _longitude: String!
    
    var _ownerID: String!
    
    var _eventID: String!
    
    var bloodGroup: String {
        return _bloodGroup
    }
    
    var expiryDate: String {
        return _expiryDate
    }
    
    var description: String {
        return _description
    }
    
    var latitude: String {
        return _latitude
    }
    
    var longitude: String {
        return _longitude
    }
    
    var ownerID: String {
        return _ownerID
    }
    
    var eventID: String {
        return _eventID
    }
    
    init(bloodGroup: String, expiryDate: String, description: String, latitude: String, longitude: String, ownerID: String) {
        self._bloodGroup = bloodGroup
        self._expiryDate = expiryDate
        self._description = description
        self._latitude = latitude
        self._longitude = longitude
        self._ownerID = ownerID
    }
    
    init(eventID: String, eventData: [String: AnyObject]) {
        
        self._eventID = eventID
        
        if let bloodGroup = eventData["blood_group"] as? String {
            self._bloodGroup = bloodGroup
        }
        
        if let expiryDate = eventData["date"] as? String {
            self._expiryDate = expiryDate
        }
        
        if let description = eventData["description"] as? String {
            self._description = description
        }
        
        if let latitude = eventData["latitude"] as? String {
            self._latitude = latitude
        }
        
        if let longitude = eventData["longitude"] as? String {
            self._longitude = longitude
        }
        
        if let ownerID = eventData["owner_id"] as? String {
            self._ownerID = ownerID
        }
    }
}
