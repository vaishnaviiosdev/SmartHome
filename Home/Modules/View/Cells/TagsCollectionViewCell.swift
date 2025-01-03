//
//  TagsCollectionViewCell.swift
//  Home
//
//  Created by Vaishnavi on 02/01/25.
//

import UIKit


class TagsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var bgView: CustomUIView!
    
    func configureCell(with menuItem: MenuItem) {
        menuLabel.text = menuItem.name
    }
}
