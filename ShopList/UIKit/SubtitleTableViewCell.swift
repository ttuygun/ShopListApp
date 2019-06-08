//
//  SubtitleTableViewCell.swift
//  ShopList
//
//  Created by Abraao Levi on 08/06/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import UIKit

class SubtitleTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
