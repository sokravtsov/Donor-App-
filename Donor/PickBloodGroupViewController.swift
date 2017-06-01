//
//  PickBloodGroupViewController.swift
//  Donor
//
//  Created by Sergey Kravtsov on 14.04.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import UIKit

final class PickBloodGroupViewController: BasicViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    // MARK: - Variables
    
    let bloodGroups = [GroupOfBlood.secondPlus,
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
        guard let groupOfBlood = UserDefaults.standard.value(forKey: UserDefaultsKey.groupOfBlood) else { return }
        // Download saved group of blood from UserDefaults and select at this row
        if let groupOfBlood = bloodGroups.index(of: groupOfBlood as! String) {
            pickerView.selectRow(groupOfBlood, inComponent: 0, animated: false)
        } else {
            print (ErrorIs.groupOfBloodNil)
        }
    }
    
    @IBAction func doneButtonDidTouch(_ sender: UIButton) {
        self.performSegue(withIdentifier: Segue.openMap, sender: self)
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
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = bloodGroups[row]
        
        var color: UIColor!

        color = pickerView.selectedRow(inComponent: component) == row ? .red : .black
        
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 15.0)!,NSForegroundColorAttributeName: color])
        return myTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadAllComponents()
        UserDefaults.standard.set(bloodGroups[row], forKey: UserDefaultsKey.groupOfBlood)
    }
}
