//
//  RandomSquaresViewController.swift
//  lesson8 HW GameCollections
//
//  Created by Сергей Золотухин on 20.09.2021.
//

import UIKit

enum Colors: CaseIterable {
    case red
    case blue
    case green
    case orange
    
    var color: UIColor {
        switch self {
        case .red:
            return UIColor.red
        case .blue:
            return UIColor.blue
        case .green:
            return UIColor.green
        case .orange:
            return UIColor.orange
        }
    }
    
    var name: String {
        switch self {
        case .red:
            return "red"
        case .blue:
            return "blue"
        case .green:
            return "green"
        case .orange:
            return "orange"
        }
    }
}

class RandomSquaresViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    
    
    @IBOutlet weak var button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Random Squares"
        
        let color1 = UIColor(red: 153 / 255, green: 26 / 255, blue: 61 / 255, alpha: 1.0).cgColor
        let color2 = UIColor(red: 243 / 255, green: 155 / 255, blue: 51 / 255, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1, color2]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func isAvailableToPlace(rect: CGRect) -> Bool {
        let isInSuperView = view.frame.contains(rect)
        var isIntersects = false
        view.subviews.forEach { subview in
            if subview.frame.intersects(rect) {
                isIntersects = true
            }
        }
        
        return isInSuperView && !isIntersects
    }
    
    func createSquare() -> CGRect {
        
        let width: Int = 55
        let originX: Int = .random(in: 0...Int(view.frame.width))
        let originY: Int = .random(in: 0...Int(view.frame.height))
        return CGRect(x: originX, y: originY, width: width, height: width)
    }
    
    
    @IBAction func actionCreateSquares(_ sender: Any) {
        let Square = createSquare()
        let randomColor = Colors.allCases.randomElement()
        let isAvailable = isAvailableToPlace(rect: Square)
        
        if isAvailable {
            let myLabel = UILabel()
            myLabel.frame = Square
            myLabel.textAlignment = .center
            let name = randomColor?.name
            let color = randomColor!.color
            myLabel.backgroundColor = color
            myLabel.text = name
            myLabel.textColor = UIColor.black
            self.view.addSubview(myLabel)
            print("EEEEE")
        } else {
            print("Ohhhhh")
        }
    }
    
}
