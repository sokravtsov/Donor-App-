//
//  Profile.swift
//  Donor
//
//  Created by Sergey Kravtsov on 14.04.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import Foundation

final class Profile {
    
    static let shared = Profile()
    
    var groupOfBlood: String? {
        return UserDefaults.standard.value(forKey: UserDefaultsKey.groupOfBlood) as? String
    }
    
    var events = [Event]()
    
}
