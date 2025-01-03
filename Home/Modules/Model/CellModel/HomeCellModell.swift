//
//  HomeCellModell.swift
//  Home
//
//  Created by Vaishnavi on 02/01/25.
//

import Foundation

enum CellType {
    case profile
    case menu
    case airCondition
    case appliances
}

class CellData {
    var type: CellType
    var profile: Profile?
    var menu: [MenuItem]?
    var gadgets: [GadgetItem]?
    
    init(type: CellType, profile: Profile? = nil, menu: [MenuItem]? = nil, gadgets: [GadgetItem]? = nil) {
        self.type = type
        self.profile = profile
        self.menu = menu
        self.gadgets = gadgets
    }
}
