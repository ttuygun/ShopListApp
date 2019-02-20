//
//  RealmSwift+Extension.swift
//  ShopList
//
//  Created by Abraao Levi on 17/02/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import Foundation
import RealmSwift

public extension Results {
    func toArray<T>(type: T.Type) -> [T] {
        return compactMap { $0 as? T }
    }
}
