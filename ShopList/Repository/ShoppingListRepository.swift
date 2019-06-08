//
//  ShoppingListRepository.swift
//  ShopList
//
//  Created by Abraao Levi on 08/06/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import Foundation

class ShoppingListRepository {
    
    static let shared = ShoppingListRepository()
    
    private var items = [
        ShoppingList(name: "Mercado", dueDate: Date(), place: Place(name: "Andorinha Hiper Center"), priotity: .medium, discount: nil,
                     items: [
                        ItemShoppingList(item: Product(name: "Arroz", price: 1099), amount: 1, discount: nil),
                        ItemShoppingList(item: Product(name: "Feijão", price: 499), amount: 2, discount: nil),
                        ItemShoppingList(item: Product(name: "Sabonete", price: 147), amount: 5, discount: nil)],
                     isDone: false),
        
        ShoppingList(name: "Lanchinhos", dueDate: Date(), place: Place(name: "Lojinhas do Grão"), priotity: .medium, discount: nil,
                     items: [
                        ItemShoppingList(item: Product(name: "Amendoas", price: 799), amount: 1, discount: nil),
                        ItemShoppingList(item: Product(name: "Castanha de Cajú", price: 548), amount: 1, discount: nil),
                        ItemShoppingList(item: Product(name: "Goma de tapioca", price: 599), amount: 2, discount: nil)],
                     isDone: true)
    ]
    
    func getAll() -> [ShoppingList] {
        return items
    }
    
    func add(_ shoppingList: ShoppingList) {
        items.append(shoppingList)
    }
}
