//
//  MenuTableViewCell.swift
//  Home
//
//  Created by Vaishnavi on 02/01/25.
//

import UIKit

protocol MenuTableViewCellDelegate:AnyObject{
    func didTapOnMenu(selectedData:MenuItem)
}

class MenuTableViewCell: UITableViewCell {
    
    var menuItems: [MenuItem] = []
    private var selectedIndexPath: IndexPath?
    weak var delegate:MenuTableViewCellDelegate?
    
    @IBOutlet weak var collectionView:UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        setInitialSelectionIfNeeded()
    }

    func configureCell(with menuItems: [MenuItem]) {
        self.menuItems = menuItems
        collectionView.reloadData()
    }
}

extension MenuTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagsCollectionViewCell", for: indexPath) as! TagsCollectionViewCell
        let menuItem = menuItems[indexPath.item]
        cell.configureCell(with: menuItem)
        // Set the background color based on selection
        if indexPath == selectedIndexPath {
            cell.backgroundColor = .white
            cell.menuLabel.textColor = .black
        }
        else {
            cell.backgroundColor = .clear
            cell.menuLabel.textColor = .greyText
        }
        applyShadowAndStyle(to: cell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = menuItems[indexPath.item]
        delegate?.didTapOnMenu(selectedData: selectedItem)
        selectedIndexPath = indexPath
        collectionView.reloadItems(at: [indexPath])


        for visibleIndexPath in collectionView.indexPathsForVisibleItems {
            if visibleIndexPath != indexPath {
                if let cell = collectionView.cellForItem(at: visibleIndexPath) as? TagsCollectionViewCell {
                    cell.backgroundColor = .clear
                    cell.menuLabel.textColor = .greyText
                }
            }
        }
            
        if let selectedCell = collectionView.cellForItem(at: indexPath) as? TagsCollectionViewCell {
            selectedCell.backgroundColor = .white
            selectedCell.menuLabel.textColor = .black
        }
    }
    
    private func applyShadowAndStyle(to cell: UICollectionViewCell) {
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOpacity = 0.5
        cell.layer.cornerRadius = cell.layer.frame.height / 2
        cell.layer.masksToBounds = true
    }
    
    func setInitialSelectionIfNeeded() {
        if selectedIndexPath == nil {
            selectedIndexPath = IndexPath(item: 0, section: 0)
        }
    }
}



