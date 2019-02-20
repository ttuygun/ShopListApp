//
//  RowViewModel.swift
//  ShopList
//
//  Created by Abraao Levi on 19/02/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import Foundation

protocol RowViewModel { }

/// Conform this protocol to handles user press action
protocol ViewModelPressible {
    var cellPressed: (() -> Void)? { get set }
}
