//
//  SplashViewController.swift
//  Home
//
//  Created by Vaishnavi on 03/01/25.
//

import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didGetStartedBtnTap(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RoundedTabBarController") as? RoundedTabBarController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
