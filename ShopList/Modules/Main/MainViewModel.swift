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
        reloadData()
    }
    
    func reloadData() {
        let lists = repository.findAllLists()
        buildRowViewModels(lists: lists)
    }
    
    func buildRowViewModels(lists: [List]) {
        var rowVMs = [RowViewModel]()
        for list in lists {
            rowVMs.append(MainCellViewModel(list: list))
        }
        rowViewModels.value = rowVMs
    }

    func getRowViewModel(at indexPath: IndexPath) -> RowViewModel {
        return rowViewModels.value[indexPath.row]
    }

    func createList(name: String) -> Void {
        let list = List()
        list.name = name
        repository.add(list)
        reloadData()
    }

    func deleteList(at index: Int) -> Void {
        if let rowVM = rowViewModels.value[index] as? MainCellViewModel {
            repository.delete(rowVM.list)
            reloadData()
        }
    }
}
