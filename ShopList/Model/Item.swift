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
    @objc dynamic var name: String = ""
    @objc dynamic var price: Int = 0
    var parentList = LinkingObjects(fromType: List.self, property: "items")
}
