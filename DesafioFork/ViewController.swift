//
//  ViewController.swift
//  DesafioFork
//
//  Created by Calebe Nunes Pastor on 15/01/18.
//  Copyright © 2018 Calebe Nunes Pastor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showMessage(_ sender: Any) {
        let greeting = showGreeting()
        Alert.showAlert(viewController: self, title: greeting.rawValue)
    }
    
    func showGreeting() -> GreetingType {
        let current = Date()
        guard let midDay = Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: current) else {
            return .none
        }
        guard let sixOClock = Calendar.current.date(bySettingHour: 18, minute: 0, second: 0, of: current) else {
            return .none
        }
        if current >= midDay && current <= sixOClock {
            return .afternoon
        } else if current >= sixOClock {
            return .night
        } else {
            return .day
        }
    }
    
}

enum GreetingType: String {
    case day = "Bom dia"
    case afternoon = "Boa tarde"
    case night = "Boa noite"
    case none = ""
}

class Alert {
    
    class func showAlert(viewController: UIViewController,title: String? = "", message: String? = "") {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}


