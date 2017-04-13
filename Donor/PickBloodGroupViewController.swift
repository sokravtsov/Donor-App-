//
//  PickBloodGroupViewController.swift
//  Donor
//
//  Created by Sergey Kravtsov on 14.04.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import UIKit

class PickBloodGroupViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    // MARK: - Variables
    
    let bloodGroups = ["A(II)Rh+", "A(II)Rh-", "B(III)Rh+", "B(III)Rh-", "AB(IV)Rh+", "AB(IV)Rh-", "O(I)Rh+", "O(I)Rh-"]
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PickBloodGroupViewController {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bloodGroups.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bloodGroups[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        titleLabel.text = bloodGroups[row]
        Profile.sharedProfile.name = bloodGroups[row]
    }
}
