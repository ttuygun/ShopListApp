//
//  List.swift
//  ShopList
//
//  Created by Abraao Levi on 16/02/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import Foundation
import RealmSwift

class List: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String? = nil
    @objc dynamic var total: Int = 0
    @objc dynamic var createdAt: Date? = nil
    @objc dynamic var modifiedAt: Date? = nil
    let items = RealmSwift.List<Item>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
