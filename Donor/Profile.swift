//
//  Profile.swift
//  Donor
//
//  Created by Sergey Kravtsov on 14.04.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import Foundation

final class Profile {
    
    class var sharedProfile: Profile {
        return _sharedProfile
    }
    
    var name: String? = nil
    
    var groupOfBlood: String? = nil
    
    
    
}
///Variable for singleton
private let _sharedProfile = Profile()
