//
//  MainController.swift
//  ShopList
//
//  Created by Abraao on 20/02/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import Foundation

class MainController {
    let viewModel: MainViewModel
    let repository: ListRepository

    init(viewModel: MainViewModel = MainViewModel(), repository: ListRepository = ListRepository()) {
        self.viewModel = viewModel
        
//        self.viewModel.createList = self.handleCreateList()
        
        
        self.repository = repository
    }

    func start() {
        viewModel.isLoading.value = true

        let lists = repository.findAllLists()
        buildViewModels(lists: lists)

        viewModel.isLoading.value = false
    }

    func buildViewModels(lists: [List]) {
        var vms = [RowViewModel]()
        for list in lists {
            let vm = MainCellViewModel(list: list)
            vms.append(vm)
        }
        viewModel.rowViewModels.value = vms
    }

    // MARK: - User interection
    
    func handleCreateList() -> ((String) -> Void) {
        return { (name) in
            let list = List()
            list.name = name
            self.repository.add(list)
            
        }
    }


    func handleRemoveList(at index: Int) {
        if let rowViewModel = viewModel.rowViewModels.value[index] as? MainCellViewModel {
            repository.delete(rowViewModel.list)
        }
    }
}
