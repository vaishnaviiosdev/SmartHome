//
//  AppliancesCollectionViewCell.swift
//  Home
//
//  Created by Vaishnavi on 02/01/25.
//

import UIKit

class AppliancesTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var collectionViewHeight:NSLayoutConstraint!
    
    var Gadget: [GadgetItem] = []
    var imageNames: [String] = ["television", "table-lamp", "router", "speaker", "microwave", "fridge"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        collectionView.collectionViewLayout = layout
    }
    
    func configureCell(with items: [GadgetItem]) {
        Gadget = items.filter { $0.name != "AC" }
        
        let numberOfColumns: CGFloat = 2
        let numberOfRows: CGFloat
        
        if Gadget.count % 2 == 0 {
            numberOfRows = CGFloat(Gadget.count / 2)
        } 
        else {
            numberOfRows = CGFloat(Gadget.count / 2 + 1)
        }
        
        let itemHeight: CGFloat = 160
        let totalHeight = numberOfRows * itemHeight
        
        DispatchQueue.main.async {
            self.collectionView.layoutIfNeeded()
            self.collectionViewHeight.constant = totalHeight
            print("The collectionviewheight is \(self.collectionViewHeight.constant)")
            self.collectionView.isScrollEnabled = totalHeight > self.collectionView.frame.size.height
            if let tableView = self.superview as? UITableView {
                tableView.beginUpdates()
                tableView.endUpdates()
            }
            self.collectionView.reloadData()
        }
    }
}

extension AppliancesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Gadget.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ApplianceItemCollectionViewCell", for: indexPath) as! ApplianceItemCollectionViewCell
        let dict = Gadget[indexPath.item]
        cell.productName.text = dict.name
        let imageName = imageNames[indexPath.item]
        
        if let image = UIImage(named: imageName) {
            cell.productImg.image = image
        }
        else {
            cell.productImg.image = UIImage(named: "default_image")
        }
        
        cell.isSwitch.isOn = dict.is_enabled
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfColumns: CGFloat = 2
        let padding: CGFloat = 5
        let availableWidth = collectionView.frame.size.width - (padding * (numberOfColumns + 1))
        let itemWidth = availableWidth / numberOfColumns
        let itemHeight: CGFloat = 160
        print("The itemheight is \(itemHeight)")
        return CGSize(width: itemWidth, height: itemHeight)
    }
}

