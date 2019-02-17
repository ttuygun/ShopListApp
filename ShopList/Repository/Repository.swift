//
//  Repository.swift
//  ShopList
//
//  Created by Abraao Levi on 17/02/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import Foundation
import RealmSwift

class Repository {
    
    let realm: Realm
    
    init() {
        realm = PersisterManager.shared.realm
    }
    
    func createObject(_ obejct: Object) {
        try! realm.write {
            realm.add(obejct)
        }
    }
    
    func deleteObject(_ obejct: Object) {
        try! realm.write {
            realm.delete(obejct)
        }
    }

    func findAll<T: Object>(type: T.Type) -> Results<T>? {
        return realm.objects(type)
    }
}
