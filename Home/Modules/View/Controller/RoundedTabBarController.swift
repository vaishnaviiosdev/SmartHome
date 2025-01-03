//
//  RoundedTabBarController.swift
//  Home
//
//  Created by Vaishnavi on 02/01/25.
//

import UIKit

class RoundedTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    private var dotView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setUpTabAppearance()
        addDotView()
        self.selectedIndex = 0 // Set the default selected index to 0
        DispatchQueue.main.async {
            self.updateDotPosition()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateDotPosition()  // Ensure dot is placed correctly after layout changes
    }
    
    private func setUpTabAppearance() {
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 30, y: self.tabBar.bounds.minY + 5, width: self.tabBar.bounds.width - 60, height: self.tabBar.bounds.height + 10), cornerRadius: (self.tabBar.frame.width / 2)).cgPath
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        layer.shadowRadius = 25.0
        layer.shadowOpacity = 0.3
        layer.borderWidth = 1.0
        layer.opacity = 1.0
        layer.isHidden = false
        layer.masksToBounds = false
        layer.fillColor = UIColor.white.cgColor
        self.tabBar.layer.insertSublayer(layer, at: 0)
        
        if let items = self.tabBar.items {
            items.forEach { item in
                item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -15, right: 0)
                // Maintain the tint color of the images without changing it
                item.selectedImage = item.selectedImage?.withRenderingMode(.alwaysOriginal)
                item.image = item.image?.withRenderingMode(.alwaysOriginal)
            }
        }
        self.tabBar.itemWidth = 30.0
        self.tabBar.itemPositioning = .centered
    }
    
    private func addDotView() {
        let dotSize: CGFloat = 6.0
        dotView = UIView(frame: CGRect(x: 0, y: 0, width: dotSize, height: dotSize))
        dotView?.backgroundColor = .black
        dotView?.layer.cornerRadius = dotSize / 2
        dotView?.isHidden = true  // Initially hidden
        
        // Add the dot view to the tab bar
        if let dotView = dotView {
            self.tabBar.addSubview(dotView)
        }
    }
    
    private func updateDotPosition() {
        guard let items = self.tabBar.items, self.selectedIndex < items.count else { return }
        let selectedItemIndex = self.selectedIndex
        let tabBarItemView = self.tabBar.subviews[selectedItemIndex + 1]
        let selectedItemFrame = tabBarItemView.frame
        let dotX = selectedItemFrame.origin.x + (selectedItemFrame.width - dotView!.frame.width) / 2
        let dotY = selectedItemFrame.origin.y + selectedItemFrame.height + 2
        dotView?.frame.origin = CGPoint(x: dotX, y: dotY)
        dotView?.isHidden = false
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        updateDotPosition()  // Update the dot position when a new tab is selected
    }
}




