//
//  ItemListCellViewModel.swift
//  ShopList
//
//  Created by Abraao Levi on 20/04/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import Foundation

class ItemListCellViewModel: RowViewModel {
    
    let item: Item
    
    init(_ item: Item) {
        self.item = item
    }
    
}
