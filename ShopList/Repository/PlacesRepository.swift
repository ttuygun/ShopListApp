//
//  PlacesRepository.swift
//  ShopList
//
//  Created by Abraao Levi on 08/06/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import Foundation

class PlacesRepository {
    
    static let shared = PlacesRepository()
    
    private var items = [
        Place(name: "Andorinha Hiper Center"),
        Place(name: "Casa do Grão")
    ]
    
    func getAll() -> [Place] {
        return items
    }
    
    func findBy(name: String) -> Place? {
        return getAll()
            .filter({ (place) -> Bool in
                return place.name == name
            })
            .first
    }
}
