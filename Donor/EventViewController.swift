//
//  EventViewController.swift
//  Donor
//
//  Created by Sergey Kravtsov on 13.04.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import UIKit

final class EventViewController: BasicViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: - Outlets
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var chooceBloodLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var chooceDateLabel: UILabel!
    
    @IBOutlet weak var datePickerView: UIDatePicker!
    
    // MARK: - Variables 
    
    /// Default II+ blood group
    var bloodGroup: String?
    
    /// Variable for saving expired date
    var expiredDate: String?
    
    var latitude: String?
    
    var longitude: String?
    
    /// Array with blood groups
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
        setupDatePicker()
    }
    
    // MARK: - Actions
    
    @IBAction func cancelButtonDidTouch(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonDidTouch(_ sender: UIButton) {
        guard let unwrapLat = latitude, let unwrapLon = longitude, let unwrapDate = expiredDate, let unwrapGroup =  bloodGroup else {
            showAlert(title: "Error 😓", message: "You should choose blood group and expired date")
            return
        }
        
        DataLoader.shared.sendEventToFirebase(latitude: unwrapLat,
                                              longitude: unwrapLon,
                                              bloodGroup: unwrapGroup,
                                              date: unwrapDate,
                                              description: textView.text)
        print("Event sended to Firebase")
        showAlertAndDismiss(title: "Event created 🙏🏽", message: "Every donor with \(unwrapGroup) blood will see this event")
    }
}

// MARK: - PickerView Delegate
extension EventViewController {
    
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
        bloodGroup = bloodGroups[row] as String
    }
}

// MARK: - DatePicker Delegate
extension EventViewController {
    
    func setupDatePicker() {
        datePickerView.datePickerMode = UIDatePickerMode.date
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    
    func datePickerValueChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        expiredDate = dateFormatter.string(from: sender.date)
    }
}
