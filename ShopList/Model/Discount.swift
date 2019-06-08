//
//  Discount.swift
//  ShopList
//
//  Created by Abraao Levi on 26/05/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import Foundation

struct Discount {
    enum `Type` {
        case percent, fixed
    }
    
    let value: Int
    let type: Type
    
    init(value: Int = 0, type: Type = .percent) {
        self.value = value
        self.type = type
    }
    
    func apply(on price: Int) -> Int {
        if self.type == .fixed {
            let result = price - value
            if result < 0 {
                return 0
            }
            return result
        }
        return price - (price * (value / 100))
    }
}
