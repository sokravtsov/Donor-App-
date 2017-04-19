//
//  Constants.swift
//  Donor
//
//  Created by Sergey Kravtsov on 13.04.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

enum GoogleMaps {
    static let apiKey = "AIzaSyCte1-hVX_xH0DSQEK83gWOiY7qS_12BAQ"
}

enum Constants {
    static let groupOfBlood = "Check your Group of Blood"
    static let save = "Save"
    static let registration = "Registration"
    static let cancel = "Cancel"
    static let enterEmailAgain = "Try enter another email"
}

enum Placeholder {
    static let email = "Enter your email"
    static let password = "Enter your password"
}

enum UserDefaultsKey {
    static let groupOfBlood = "groupOfBlood"
}

enum ErrorIs {
    static let groupOfBloodNil = "Group of blood is nil"
    static let notValidEmail = "Not valid email"
}

enum GroupOfBlood {
    static let secondPlus = "A(II)Rh+"
    static let secondMinus = "A(II)Rh-"
    static let thirdPlus = "B(III)Rh+"
    static let thirdMinus = "B(III)Rh-"
    static let fourthPlus = "AB(IV)Rh+"
    static let fourthMinus = "AB(IV)Rh-"
    static let firstPlus = "O(I)Rh+"
    static let firstMinus = "O(I)Rh-"
}

enum Segue {
    static let openMap = "openMap"
    static let toPickerGroupOfBlood = "toPickerGroupOfBlood"
    static let fromLoginToMap = "fromLoginToMap"
    static let toPickerVC = "toPickerVC"
    static let createEvent = "createEvent"
}

enum Radius {
    static let corner = 5
}

enum CellIdentifier {
    static let event = "cell"
}

enum FirebaseHeader {
    static let events = "events"
}

