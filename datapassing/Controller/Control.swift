//
//  Control.swift
//  datapassing
//
//  Created by Daniel Paymar on 5/17/24.
//

import UIKit

class Essential {
    var itemName: String
    var itemType: GearItemType
    var count = 0
    
    init(itemName: String, itemType: GearItemType) {
        self.itemName = itemName
        self.itemType = .base
    }
}
class Day  {
    var itemName: String
    var itemType: GearItemType
    
    init(itemName: String, itemType: GearItemType) {
        self.itemName = itemName
        self.itemType = .day
    }
}
class Night {
    var itemName: String
    var itemType: GearItemType
    
    init(itemName: String, itemType: GearItemType) {
        self.itemName = itemName
        self.itemType = .night
    }
}
class MultiDay {
    var itemName: String
    var itemType: GearItemType
    
    init(id: String, itemName: String, itemType: GearItemType) {
        self.itemName = itemName
        self.itemType = .multiDay
    }
}

enum GearItemType {
    case base
    case day
    case night
    case multiDay
}
