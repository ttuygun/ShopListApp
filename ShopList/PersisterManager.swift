//
//  PersisterManager.swift
//  ShopList
//
//  Created by Abraao Levi on 16/02/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import Foundation
import RealmSwift

class PersisterManager {
    static let shared = PersisterManager()
    
    let realm: Realm
    
    init() {
        realm = try! Realm()
    }
}
