//
//  UITableViewCell+Extension.swift
//  ShopList
//
//  Created by Abraao Levi on 19/02/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import Foundation
import UIKit

public extension UITableViewCell {
    /// Generated cell identifier derived from class name
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
}
