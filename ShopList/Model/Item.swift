//
//  ListItem.swift
//  ShopList
//
//  Created by Abraao Levi on 16/02/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    
    enum DicountType: String {
        case none, fixed, percentage
    }
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String? = nil
    @objc dynamic var _price: RealmDecimal? = nil
    @objc dynamic var dicountType: String = DicountType.none.rawValue
    @objc dynamic var dicountValue: RealmDecimal? = nil
    @objc dynamic var createdAt: Date? = nil
    
    var parentList = LinkingObjects(fromType: List.self, property: "items")
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    override class func ignoredProperties() -> [String] {
        return ["price"]
    }
    
    var price: Decimal {
        guard let price = _price?.value else {
            return NSNumber(integerLiteral: 0).decimalValue
        }
        guard let discount = dicountValue?.value else {
            return price
        }
        if dicountType == DicountType.fixed.rawValue {
            return price - discount
        }
        if dicountType == DicountType.percentage.rawValue {
            return price - (price * discount / 100)
        }
        return price
    }
    
    func setPrice(_ value: Decimal) {
        let price = RealmDecimal()
        price.value = value
        self._price = price
    }
    
    func setDiscount(type: DicountType) {
        self.dicountType = String(describing: type)
    }
    
    func setDiscount(value: Decimal?) {
        guard let value = value else {
            self.dicountValue = nil
            return
        }
        
        let discountValue = RealmDecimal()
        discountValue.value = value
        self.dicountValue = discountValue
    }
}
