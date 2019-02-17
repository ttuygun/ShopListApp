//
//  MainViewModel.swift
//  ShopList
//
//  Created by Abraao Levi on 16/02/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import Foundation

class MainViewModel {

    let repository = ListRepository()
    
    var lists: [List] {
        return repository.findAllLists()
    }
    
    func addNewList(_ name: String) {
        let list = List()
        list.name = name
        
        repository.add(list)
    }
    
    func removeList(at index: Int) {
        let list = lists[index]
        repository.delete(list)
    }
    
}
