//
//  testVC.swift
//  Donor
//
//  Created by Sergey Kravtsov on 17.04.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import Foundation
import Eureka


class testVC: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ SelectableSection<ListCheckRow<String>>("Specify the required blood group", selectionType: .singleSelection(enableDeselection: true))
        
        let bloodGroups = [GroupOfBlood.secondPlus,
                          GroupOfBlood.secondMinus,
                          GroupOfBlood.thirdPlus,
                          GroupOfBlood.thirdMinus,
                          GroupOfBlood.fourthPlus,
                          GroupOfBlood.fourthMinus,
                          GroupOfBlood.firstPlus,
                          GroupOfBlood.firstMinus]
        
        for option in bloodGroups {
            form.last! <<< ListCheckRow<String>(option){ listRow in
                listRow.title = option
                listRow.selectableValue = option
                listRow.value = nil
            }
        }
        
        form +++ Section("Optional")
            <<< TextRow(){ row in
                row.title = "Description"
                row.placeholder = "Enter text here"
            }
            <<< PhoneRow(){
                $0.title = "Phone number"
                $0.placeholder = "Enter phone number here"
            }
            +++ Section("Expiry date of blood donation")
            <<< DateRow(){
                $0.title = "Choose date"
                $0.value = Date(timeIntervalSinceReferenceDate: 0)
        }
    }
}
