//
//  ButtonAnimationViewController.swift
//  ButtonAnimationPractice
//
//  Created by Jonathan Jones on 3/17/16.
//  Copyright © 2016 JJones. All rights reserved.
//

import UIKit

let paisleyColor = UIColor(colorLiteralRed: 186/255, green: 152/255, blue: 255/255, alpha: 1.0)

class ButtonAnimationViewController: UIViewController {
    let animator = UIDynamicAnimator()
    
    @IBOutlet weak var mainMenuButton: UIButton!
    let buttonOne = MenuButtons()
    let buttonTwo = MenuButtons()
    let buttonThree = MenuButtons()
    let buttonFour = MenuButtons()
    var buttonsArray: Array <MenuButtons> = []
    
    var fanned: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsArray = [buttonOne, buttonTwo, buttonThree, buttonFour]
        fanned = false
        setupButton(mainMenuButton)
    }
    
    func setupButton (button: UIButton) {
        
        let viewHeight = self.view.frame.height
        let viewWidth = self.view.frame.width
        let buttonRect = CGRectMake(viewWidth / 2, viewHeight / 2,
            50,50)
        button.frame = buttonRect
        button.layer.cornerRadius = button.frame.width / 2;
        
        button.layer.borderColor = paisleyColor.CGColor
        button.layer.borderWidth = 0.75
        button.layer.borderColor = UIColor.whiteColor().CGColor
        button.layer.backgroundColor = paisleyColor.CGColor
        button.titleLabel?.textColor = UIColor.whiteColor()
        button.tintColor = UIColor.grayColor()
        button.clipsToBounds = true
    }
    
    @IBAction func menuButtonTapped(sender: MenuButtons) {
        animator.removeAllBehaviors()
        if fanned == false {
            for button in buttonsArray {
                button.drawRect(mainMenuButton.frame)
            }
            fanbuttons(0, title: "0", buttonArray: buttonsArray)
        } else {
            returnButtons()
        }
    }
    
    func fanbuttons (index: Int, title: String, buttonArray: [MenuButtons]) {
        var snapPoint = CGPoint()
        var snapBehavior: UISnapBehavior
        
        let button = buttonArray[index]
        
        
        switch index {
            
        case 0:
            snapPoint = CGPointMake(button.center.x - (2 * button.frame.size.width),
                button.center.y)
            
        case 1:
            snapPoint = CGPointMake(button.center.x - button.frame.size.width,
                button.center.y - button.frame.size.height)
            
            
        case 2:
            snapPoint = CGPointMake(button.center.x + button.frame.size.width,
                button.center.y - button.frame.size.height)
            
            
        case 3:
            snapPoint = CGPointMake(button.center.x + (2 * button.frame.size.width),
                button.center.y)
            
        default:
            return
        }
        button.setTitle("\(index)", forState: UIControlState.Normal)
        self.view.addSubview(button)
        self.view.bringSubviewToFront(mainMenuButton)
        snapBehavior = UISnapBehavior(item: button, snapToPoint: snapPoint)
        snapBehavior.damping = 1.0
        animator.addBehavior(snapBehavior)
        fanned = true
        
        if buttonArray.count > (index + 1) {
            fanbuttons(index+1, title: "\(index+1)", buttonArray: buttonsArray)
        } 
    }
    
    func returnButtons () {
    animator.removeAllBehaviors()
        for button in buttonsArray {
            print(mainMenuButton.center)
            let centerPoint = mainMenuButton.center
            let snapbehavior = UISnapBehavior(item: button, snapToPoint: centerPoint)
            snapbehavior.damping = 1.0
            animator.addBehavior(snapbehavior)
            self.view.bringSubviewToFront(mainMenuButton)
            fanned = false
        }
        
    }
}
