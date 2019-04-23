//
//  RealmDecimal.swift
//  ShopList
//
//  Created by Abraao Levi on 20/04/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import Foundation
import RealmSwift

//
// RealmDecimal soluction based on
// https://stackoverflow.com/a/54960409/4214312
// https://github.com/realm/realm-cocoa/issues/2539#issuecomment-142021927
//
class RealmDecimal: Object {
    @objc private dynamic var _value = ""
    
    var value: Decimal {
        get {
            let formatter = NumberFormatter()
            formatter.locale = Locale(identifier: "pt_BR")
            formatter.numberStyle = .decimal
            
            guard let number = formatter.number(from: _value) else {
                return NSNumber(floatLiteral: 0).decimalValue
            }
            
            return number.decimalValue
        }
        set { _value = newValue.description }
    }
    
    override class func ignoredProperties() -> [String] {
        return ["value"]
    }
}
