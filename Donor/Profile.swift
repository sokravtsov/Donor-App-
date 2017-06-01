//
//  Profile.swift
//  Donor
//
//  Created by Sergey Kravtsov on 14.04.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import Foundation

final class Profile {
    
    // MARK: - Variables
    
    static let shared = Profile()
    
    var groupOfBlood: String?
    
    var events = [Event]()
}
