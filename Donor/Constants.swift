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
    static let groupOfBlood = LocalizedStrings.groupOfBlood.localized
    static let save = LocalizedStrings.save.localized
    static let registration = LocalizedStrings.registration.localized
    static let cancel = LocalizedStrings.cancel.localized
    static let enterEmailAgain = LocalizedStrings.enterEmailAgain.localized
}

enum Placeholder {
    static let email = LocalizedStrings.email.localized
    static let password = LocalizedStrings.password.localized
}

enum UserDefaultsKey {
    static let groupOfBlood = "groupOfBlood"
}

enum ErrorIs {
    static let groupOfBloodNil = "Group of blood is nil"
    static let notValidEmail = LocalizedStrings.notValidEmail.localized
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
    static let toEventInfo = "toEventInfo"
}

enum Radius {
    static let corner = 5
}

enum Border {
    static let width = 1
}

enum CellIdentifier {
    static let event = "cell"
}

enum FirebaseHeader {
    static let events = "events"
}

