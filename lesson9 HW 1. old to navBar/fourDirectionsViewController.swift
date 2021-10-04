//
//  fourDirectionsViewController.swift
//  lesson8 HW GameCollections
//
//  Created by Сергей Золотухин on 20.09.2021.
//

import UIKit

//  • сделать перемещение кружочка через enum, кружок не касается стен, при невозможности перемещения в label сообщение об ошибке, при перемещении в label направление перемещения

enum Direction {
    case up
    case down
    case left
    case right
}

class fourDirectionsViewController: UIViewController {

    @IBOutlet weak var cantainerView: UIView!
    @IBOutlet weak var informLabel: UILabel!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    
    
    let view1 = UIView()
    
    override func viewWillAppear(_ animated : Bool) {
        super.viewWillAppear(animated)
        
        title = "Four Directions"
        
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
    
    
    
    func move(direction: Direction) {
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
    
    @IBAction func buttonUp(_ sender: Any) {
        view1.backgroundColor = getRandomColor()
        
        if view1.frame.minY > 10 {
            move(direction: .up)
            informLabel.text = "moving UP"
        } else {
            informLabel.text = "OMG ERROR!!!"
        }
    }
    
    @IBAction func buttonDown(_ sender: Any) {
        view1.backgroundColor = getRandomColor()
        
        if view1.frame.maxY + 10 < view.frame.height {
            move(direction: .down)
            informLabel.text = "moving DOWN"
        } else {
            informLabel.text = "OMG ERROR!!!"
        }
    }
    
    @IBAction func buttonRight(_ sender: Any) {
        view1.backgroundColor = getRandomColor()
        
        if view1.frame.maxX + 10 < view.frame.width {
            move(direction: .right)
            informLabel.text = "moving RIGHT"
        } else {
            informLabel.text = "OMG ERROR!!!"
        }
    }
    
    @IBAction func buttonLeft(_ sender: Any) {
        view1.backgroundColor = getRandomColor()
        
        if view1.frame.minX > 10 {
            move(direction: .left)
            informLabel.text = "moving LEFT"
        } else {
            informLabel.text = "OMG ERROR!!!"
        }
    }
  
}
