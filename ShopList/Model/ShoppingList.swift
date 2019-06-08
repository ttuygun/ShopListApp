//
//  ShoppingList.swift
//  ShopList
//
//  Created by Abraao Levi on 26/05/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import Foundation

struct ShoppingList {
    enum Priority {
        case high, medium, low
    }
    
    var name: String?
    var dueDate: Date?
    var place: Place?
    var priotity: Priority = .medium
    var discount: Discount? = nil
    var items = [ItemShoppingList]()
    var isDone: Bool = false
    
    var total: Int {
        return items.reduce(0, { (result, item) -> Int in
            return item.total + result
        })
    }
    
}
