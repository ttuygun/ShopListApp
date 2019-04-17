//
//  MainViewModel.swift
//  ShopList
//
//  Created by Abraao Levi on 16/02/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import Foundation

class MainViewModel {

    let repository: ListRepository

    let rowViewModels = Observable<[RowViewModel]>(value: [])
    let isLoading = Observable<Bool>(value: false)

    init(repository: ListRepository = ListRepository()) {
        self.repository = repository
    }

    func getRowViewModel(at indexPath: IndexPath) -> RowViewModel {
        return rowViewModels.value[indexPath.row]
    }

    func createList(name: String) -> Void {
        let list = List()
        list.name = name
        repository.add(list)
    }

    func deleteList(at index: Int) -> Void {
        if let rowVM = rowViewModels.value[index] as? MainCellViewModel {
            repository.delete(rowVM.list)
        }
    }
}
