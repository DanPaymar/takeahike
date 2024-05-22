//
//  Control.swift
//  datapassing
//
//  Created by Daniel Paymar on 5/17/24.
//

import UIKit

class Essential: Gear {
    var id: String = UUID().uuidString
    var itemName: String
    var itemType: GearItemType
    
    init(itemName: String, itemType: GearItemType) {
        self.itemName = itemName
        self.itemType = .base
    }
}
class Day: Gear {
    var id: String = UUID().uuidString
    var itemName: String
    var itemType: GearItemType
    
    init(itemName: String, itemType: GearItemType) {
        self.itemName = itemName
        self.itemType = .day
    }
}
class Night: Gear {
    var id: String = UUID().uuidString
    var itemName: String
    var itemType: GearItemType
    
    init(itemName: String, itemType: GearItemType) {
        self.itemName = itemName
        self.itemType = .night
    }
}
class MultiDay: Gear {
    var id: String = UUID().uuidString
    var itemName: String
    var itemType: GearItemType
    
    init(id: String, itemName: String, itemType: GearItemType) {
        self.itemName = itemName
        self.itemType = .multiDay
    }
}

protocol Gear {
    var id: String { get set }
    var itemName: String { get set }
    var itemType: GearItemType { get set }
}

enum GearItemType {
    case base
    case day
    case night
    case multiDay
}
