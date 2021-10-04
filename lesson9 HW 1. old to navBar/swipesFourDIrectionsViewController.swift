//
//  swipesFourDIrectionsViewController.swift
//  lesson9 HW 1. old to navBar
//
//  Created by Сергей Золотухин on 23.09.2021.
//

import UIKit

//  • переделать ДЗ-7.2 на перемещение кружка по свайпам


enum Direction2 {
    case up
    case down
    case left
    case right
}

class swipesFourDirectionsViewController: UIViewController {
    
    @IBOutlet weak var upView: UIView!
    
    
    @IBOutlet weak var cantainerView: UIView!
    @IBOutlet weak var informLabel: UILabel!
    
    
    let view1 = UIView()
    
    override func viewWillAppear(_ animated : Bool) {
        super.viewWillAppear(animated)
        
        title = "Swipe Four Directions"
        
        configRecognizer()
        configRecognizer2()
        configRecognizer3()
        configRecognizer4()
        
        move(direction: .down)
        
        let coordX = view.frame.width / 2 - view1.frame.width
        let coordY = view.frame.height / 2 - view1.frame.height
        
        
        view1.backgroundColor = .red
        cantainerView.addSubview(view1)
        view1.layer.cornerRadius = 25
        view1.frame = CGRect(x: coordX, y:  coordY, width: 50, height: 50)
        
    }
    
    //let randomInt = Int.random(in: 0..<300)
    
    
    func getRandomColor() -> UIColor {  // создаем вызов случайного цвета
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    
    
    func move(direction: Direction2) {
        switch direction {
        
        case .up:    view1.frame = CGRect(x: view1.frame.origin.x,
                                          y: view1.frame.origin.y - 10,
                                          width: 50,
                                          height: 50)
        case .down:  view1.frame = CGRect(x: view1.frame.origin.x,
                                          y: view1.frame.origin.y + 10,
                                          width: 50,
                                          height: 50)
        case .left:  view1.frame = CGRect(x: view1.frame.origin.x - 10,
                                          y: view1.frame.origin.y,
                                          width: 50,
                                          height: 50)
        case .right: view1.frame = CGRect(x: view1.frame.origin.x + 10,
                                          y: view1.frame.origin.y,
                                          width: 50,
                                          height: 50)
        }
        
    }
    
    func configRecognizer() {
        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(actionSwipe))
        upView.addGestureRecognizer(recognizer)
        recognizer.direction = .up
    }
    func configRecognizer2() {
        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(actionSwipe2))
        upView.addGestureRecognizer(recognizer)
        recognizer.direction = .down
    }
    func configRecognizer3() {
        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(actionSwipe3))
        upView.addGestureRecognizer(recognizer)
        recognizer.direction = .right
    }
    func configRecognizer4() {
        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(actionSwipe4))
        upView.addGestureRecognizer(recognizer)
        recognizer.direction = .left
    }
    
    @objc func actionSwipe(_sender: Any) {
        view1.backgroundColor = getRandomColor()
        
        if view1.frame.minY > 10 {
            move(direction: .up)
            informLabel.text = "moving UP"
        } else {
            informLabel.text = "OMG ERROR!!!"
        }
    }
    
    @objc func actionSwipe2(_sender: Any) {
        view1.backgroundColor = getRandomColor()
        
        if view1.frame.maxY + 10 < view.frame.height {
            move(direction: .down)
            informLabel.text = "moving DOWN"
        } else {
            informLabel.text = "OMG ERROR!!!"
        }
    }
    
    @objc func actionSwipe3(_sender: Any) {
        view1.backgroundColor = getRandomColor()
        
        if view1.frame.maxX + 10 < view.frame.width {
            move(direction: .right)
            informLabel.text = "moving RIGHT"
        } else {
            informLabel.text = "OMG ERROR!!!"
        }
    }
    
    @objc func actionSwipe4(_sender: Any) {
        view1.backgroundColor = getRandomColor()
        
        if view1.frame.minX > 10 {
            move(direction: .left)
            informLabel.text = "moving LEFT"
        } else {
            informLabel.text = "OMG ERROR!!!"
        }
    }
}
