//
//  Alerts.swift
//  Donor
//
//  Created by Sergey Kravtsov on 14.04.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import Foundation
import UIKit

protocol Alerts {
    func showAlert(title: String, message : String?)
}

extension UIViewController: Alerts {
    func showAlert(title: String, message : String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showAlertAndDismiss(title: String, message : String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

}
