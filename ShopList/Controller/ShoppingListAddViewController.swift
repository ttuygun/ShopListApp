//
//  ShoppingListAddViewController.swift
//  ShopList
//
//  Created by Abraao Levi on 08/06/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import UIKit
import Eureka

class ShoppingListAddViewController: FormViewController {
    
    var shoppingList = ShoppingList(name: "My Shopping List", dueDate: nil, place: nil, priotity: .medium, discount: nil, items: [], isDone: false)
    let placesRepo = PlacesRepository.shared
    let shoppingListRepo = ShoppingListRepository.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Add New List"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(close))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save))
        
        form
            +++ Section("List information")
            <<< TextRow() {
                $0.title = "Name"
                $0.placeholder = "My Shopping List"
                $0.onChange({ [weak self] row in
                    self?.shoppingList.name = row.value
                })
            }
            <<< DateTimeRow() {
                $0.title = "Due date"
                $0.minimumDate = Date()
                $0.onChange { [weak self] row in
                    if let date = row.value {
                        self?.shoppingList.dueDate = date
                    }
                }
            }
            
            +++ Section("Place")
            <<< PushRow<String>() {
                $0.title = "Place"
                $0.options = placesRepo.getAll().map({ $0.name ?? "" })
                $0.onChange({ [weak self] row in
                    if let value = row.value,
                        let place = self?.placesRepo.findBy(name: value) {
                        self?.shoppingList.place = place
                    } else {
                        self?.shoppingList.place = nil
                    }
                })
        }
    }
    
    @objc func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func save() {
        shoppingListRepo.add(shoppingList)
        close()
    }
    
}
