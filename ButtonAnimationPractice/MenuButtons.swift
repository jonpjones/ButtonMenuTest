//
//  MenuButtons.swift
//  ButtonAnimationPractice
//
//  Created by Jonathan Jones on 3/17/16.
//  Copyright © 2016 JJones. All rights reserved.
//

import Foundation
import UIKit

class MenuButtons: UIButton {
    
    override func drawRect(rect: CGRect) {
        self.frame = rect
        self.layer.cornerRadius = self.frame.width / 2;
        self.layer.borderColor = paisleyColor.CGColor
        self.layer.borderWidth = 0.75
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.backgroundColor = paisleyColor.CGColor
        self.titleLabel?.textColor = UIColor.whiteColor()
        self.tintColor = UIColor.grayColor()
        self.clipsToBounds = true
    }

    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }
}