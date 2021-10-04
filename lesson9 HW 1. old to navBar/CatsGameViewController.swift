//
//  CatsGameViewController.swift
//  lesson8 HW GameCollections
//
//  Created by Сергей Золотухин on 20.09.2021.
//

import UIKit

// • Игрушка для котиков - появление разноцветного кружочка, по тапу исчезает и появляется в новом месте (кодом)

class CatsGameViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var button2: UIButton!
    
    let view1 = UIView()
    
    override func viewWillAppear(_ animated : Bool) {
        super.viewWillAppear(animated)
        
        title = "Cats Game"
        
        view1.backgroundColor = .red
        containerView.addSubview(view1)
        view1.layer.cornerRadius = 25
        view1.frame = CGRect(x: .random(in: 0...view.frame.width - 50), y:  .random(in: 0...view.frame.height - 50), width: 50, height: 50)
    }
    
    //let randomInt = Int.random(in: 0..<300)
    
    
    func getRandomColor() -> UIColor {  // создаем вызов случайного цвета
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    
    @IBAction func Button(_ sender: Any) {
        view1.backgroundColor = getRandomColor()
        
        view1.frame = CGRect(x: .random(in: 0...view.frame.width - 50),
                             y:  .random(in: 0...view.frame.height - 50),
                             width: 50,
                             height: 50)
        
    }
    
}
