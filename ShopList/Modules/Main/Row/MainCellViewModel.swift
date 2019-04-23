//
//  MainCellViewModel.swift
//  ShopList
//
//  Created by Abraao on 20/02/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import Foundation

class MainCellViewModel: RowViewModel {
    let list: List

    var listName: String? {
        return list.name
    }

    init(_ list: List) {
        self.list = list
    }
}
