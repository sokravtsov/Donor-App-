//
//  UIViewController+ActivityIndicator.swift
//  Donor
//
//  Created by Sergey Kravtsov on 19.04.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import Foundation
import UIKit

private var activityIndicator: ActivityIndicator?

protocol activityIndicatorDelegate {
    func showActivityIndicator()
    func hideActivityIndicator()
}

extension UIViewController: activityIndicatorDelegate {
    
    internal func showActivityIndicator() {
        if activityIndicator?.superview != nil {
            activityIndicator?.removeFromSuperview()
        }
        activityIndicator = ActivityIndicator(frame: UIScreen.screenBounds())
        activityIndicator?.activityIndicator.startAnimating()
        activityIndicator?.alpha = 1
        self.view.addSubview(activityIndicator!)
        print("ShowIndicator-----------")
    }
    
    internal func hideActivityIndicator() {
        activityIndicator?.activityIndicator.stopAnimating()
        Animations.hide(view: activityIndicator!, alpha: 0)
        print("HideIndicator-----------")
    }
}

