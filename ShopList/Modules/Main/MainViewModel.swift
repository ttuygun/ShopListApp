//
//  MainViewModel.swift
//  ShopList
//
//  Created by Abraao Levi on 16/02/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import Foundation

class MainViewModel {
    let rowViewModels = Observable<[RowViewModel]>(value: [])
    let isLoading = Observable<Bool>(value: false)
    
    var createList: ((String) -> Void)?
    var deleteList: ((Int) -> Void)?
    
    func getRowViewModel(at indexPath: IndexPath) -> RowViewModel {
        return rowViewModels.value[indexPath.row]
    }
}
