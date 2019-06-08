//
//  ItemShoppingList.swift
//  ShopList
//
//  Created by Abraao Levi on 26/05/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import Foundation

struct ItemShoppingList {
    var item: Product? = nil
    var amount: Int = 0
    var discount: Discount? = nil
    
    var total: Int {
        var price = item?.price ?? 0
        if let discount = discount {
            price = discount.apply(on: price)
        }
        return price * amount
    }
}
