//
//  Event.swift
//  Donor
//
//  Created by Sergey Kravtsov on 17.04.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import Foundation

final class Event {
    
    var bloodGroup: String
    var expiryDate: Date
    var description: String?
    var ownerID: String?
    
    init(bloodGroup: String, expiryDate: Date, description: String?, ownerID: String?) {
        self.bloodGroup = bloodGroup
        self.expiryDate = expiryDate
        self.description = description
        self.ownerID = ownerID
    }
}
