//
//  ActivityIndicator.swift
//  Donor
//
//  Created by Sergey Kravtsov on 19.04.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import Foundation
import UIKit

final class ActivityIndicator: UIView {
    
    var activityIndicator = UIActivityIndicatorView()
    let heightActivityIndicator = CGFloat(40)

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: heightActivityIndicator, height: heightActivityIndicator)
        activityIndicator.activityIndicatorViewStyle = .whiteLarge
        activityIndicator.color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        activityIndicator.center.x = self.center.x
        activityIndicator.center.y = self.frame.height/2
        self.addSubview(activityIndicator)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
