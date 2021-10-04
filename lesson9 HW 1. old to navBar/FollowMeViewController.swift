//
//  FollowMeViewController.swift
//  lesson9 HW 1. old to navBar
//
//  Created by Сергей Золотухин on 23.09.2021.
//

// • отдельный проект: перемещаем палец по экрану не отрывая - за ним перемещается кружок

import UIKit

class FollowMeViewController: UIViewController {
    
    let greenCircle = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Follow me"
     
        greenCircle.backgroundColor = .green
        view.addSubview(greenCircle)
        greenCircle.frame = CGRect(x: view.frame.width/2 - greenCircle.frame.width / 2, y:  view.frame.height/2 - greenCircle.frame.height / 2, width: 80, height: 80)
        greenCircle.layer.cornerRadius = greenCircle.frame.width / 2
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragTheView))
        
        greenCircle.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc func dragTheView(recognizer: UIPanGestureRecognizer) {
        
        if recognizer.state == .began {
            print("Gesture began")
        } else if recognizer.state == .changed {
            let translation = recognizer.translation(in: self.view)
            
            let newX = greenCircle.center.x + translation.x
            let newY = greenCircle.center.y + translation.y
            
            greenCircle.center = CGPoint(x: newX, y: newY)
            recognizer.setTranslation(CGPoint.zero, in: self.view)
            
            
        } else if recognizer.state == .ended {
            
        }
        
    }
    
}
