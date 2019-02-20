//
//  MainCellViewModel.swift
//  ShopList
//
//  Created by Abraao on 20/02/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import Foundation

class MainCellViewModel: RowViewModel {
    let listName: String

    init(list: List) {
        self.listName = list.name
    }
}
