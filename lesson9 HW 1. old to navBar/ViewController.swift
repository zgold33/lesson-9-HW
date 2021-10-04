// • переделать предыдущие ДЗ на навконтроллер


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    

    override func viewDidLoad() {
        
        title = "HOME"
        
        configNavigationBar()
        
        super.viewDidLoad()
        let color1 = UIColor(red: 139 / 255, green: 253 / 255, blue: 61 / 255, alpha: 1.0).cgColor
        let color2 = UIColor(red: 94 / 255, green: 40 / 255, blue: 49 / 255, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1, color2]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func configNavigationBar() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .orange
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.heavy)]
    }
    
    @IBAction func Catsgame(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(identifier: "CatsGameViewControllerID")
        navigationController?.pushViewController(controller, animated: true)
        }
    
    @IBAction func Randomsquares(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(identifier: "RandomSquaresViewControllerID")
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func Fourdirections(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(identifier: "fourDirectionsViewControllerID")
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func tapAndCircle(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(identifier: "TapAndCircleViewControllerID")
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func swipesGourDirection(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(identifier: "swipesFourDirectionsViewControllerID")
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func followMe(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(identifier: "FollowMeViewControllerID")
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}


