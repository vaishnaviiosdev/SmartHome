//
//  ProfileViewController.swift
//  Home
//
//  Created by Vaishnavi on 03/01/25.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didBackBtnTap(_ sender: Any) {
        if let tabBarController = self.tabBarController {
            tabBarController.selectedIndex = 0
        }
    }
}
