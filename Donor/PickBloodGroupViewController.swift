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
    
    let bloodGroups = [
        GroupOfBlood.secondPlus,
        GroupOfBlood.secondMinus,
        GroupOfBlood.thirdPlus,
        GroupOfBlood.thirdMinus,
        GroupOfBlood.fourthPlus,
        GroupOfBlood.fourthMinus,
        GroupOfBlood.firstPlus,
        GroupOfBlood.firstMinus]
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = Constants.groupOfBlood
        
        // Download saved group of blood from UserDefaults and select at this row
        guard let groupOfBlood = bloodGroups.index(of: UserDefaults.standard.value(forKey: UserDefaultsKey.groupOfBlood) as! String) else {
            print (ErrorIs.groupOfBloodNil)
            return
        }
        pickerView.selectRow(groupOfBlood, inComponent: 0, animated: false)
    }
}

// MARK: - Extensions

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource

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
        Profile.sharedProfile.name = bloodGroups[row]
        UserDefaults.standard.set(bloodGroups[row], forKey: UserDefaultsKey.groupOfBlood)
    }
}
