//
//  HomeModel.swift
//  Home
//
//  Created by Vaishnavi on 02/01/25.
//

import Foundation

class DataModel: Codable {
    var profile: Profile
    var menu: [MenuItem]
    var gadgets: [GadgetItem]
    
    init(profile: Profile, menu: [MenuItem], gadgets: [GadgetItem]) {
        self.profile = profile
        self.menu = menu
        self.gadgets = gadgets
    }
}

class Profile: Codable {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}

class MenuItem: Codable {
    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

class GadgetItem: Codable {
    var id: Int
    var name: String
    var is_enabled: Bool
    
    init(id: Int, name: String, is_enabled: Bool) {
        self.id = id
        self.name = name
        self.is_enabled = is_enabled
    }
}
