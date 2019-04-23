//
//  ItemRepository.swift
//  ShopList
//
//  Created by Abraao Levi on 20/04/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import Foundation

class ItemRepository: Repository {
    
    @discardableResult
    func add(_ item: Item) -> Item? {
        let primaryKey = incrementID(for: Item.self)
        item.id = primaryKey
        
        if item.createdAt == nil {
            item.createdAt = Date()
        }
        
        return createObject(item)
    }
    
    @discardableResult
    func delete(_ item: Item) -> Bool {
        return deleteObject(item)
    }
    
    func link(_ item: Item, to list: List) {
        list.items.append(item)
    }
}
