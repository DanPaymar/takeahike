//
//  User.swift
//  datapassing
//
//  Created by Daniel Paymar on 5/17/24.
//

import UIKit

class User {
    // create a variable to hold an array of essential objects.
    var datasource: [Essential] = [
        Essential(itemName: "Backpack", itemType: .base),
        Essential(itemName: "Water bottle", itemType: .base),
        Essential(itemName: "Wind jacket", itemType: .base)
    ]
    // function to check if the user returns an array of essential objects
    static func userTableItems(user: User) -> [Essential] {
        // create a variable initialized to an empty array of essentials
        var toReturn = [Essential]()
        // loop through the users essential objects
        for item in user.datasource {
            // if the users array is greater than zero return the object
            if item.count > 0 {
                toReturn.append(item)
            }
        }
        return toReturn
    }
}
