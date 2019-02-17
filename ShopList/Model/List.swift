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
    @objc dynamic var name: String = ""
    @objc dynamic var total: Int = 0
    let items = RealmSwift.List<Item>()
}
