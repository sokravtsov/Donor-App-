//
//  Strings+Localized.swift
//  Donor
//
//  Created by Sergey Kravtsov on 05.06.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import Foundation

public extension String {
    public var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}

