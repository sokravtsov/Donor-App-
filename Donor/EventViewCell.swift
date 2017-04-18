//
//  EventViewCell.swift
//  Donor
//
//  Created by Sergey Kravtsov on 18.04.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import Foundation
import UIKit

class EventViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var bloodImage: UIImageView!
    
    @IBOutlet weak var bloodGroupLabel: UILabel!
    
    // MARK: - Properties
    
    var event: Event!
    
    // MARK: - Methods

    func configureCell(event: Event) {
        self.event = event
        self.bloodGroupLabel.text = event.bloodGroup
    }
    
}
