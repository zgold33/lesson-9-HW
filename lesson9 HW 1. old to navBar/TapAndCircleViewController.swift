//
//  TapAndCircleViewController.swift
//  lesson9 HW 1. old to navBar
//
//  Created by Сергей Золотухин on 22.09.2021.
//
// • сделать игрушку - куда тапнул, там появляется кружок. Если там уже был круг - он исчезает


import UIKit

class TapAndCircleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Tap and Circle"
        
        configRecognizer()
    }
    
    func getRandomColor() -> UIColor {
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    func configRecognizer() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(actionTap))
        recognizer.numberOfTapsRequired = 1
        view.addGestureRecognizer(recognizer)
    }
    
    func getCircleView() -> UIView{
        
        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view1.layer.cornerRadius = view1.frame.width / 2
        view1.backgroundColor = getRandomColor()
        
        return view1
    }
    
    @objc func actionTap(_ sender: Any) {
        
        let circleView = getCircleView()
        circleView.center = (sender as AnyObject).location(in: view)
        
        let tapCircleRecognizer = UITapGestureRecognizer(target:self, action: #selector(tapTap))
        tapCircleRecognizer.numberOfTapsRequired = 1
        
        circleView.addGestureRecognizer(tapCircleRecognizer)
        
        self.view.addSubview(circleView)
    }
    
    @objc func tapTap(_ sender: Any) {
        
        (sender as AnyObject).view?.removeFromSuperview()
    }
    
}
