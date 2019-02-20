//
//  MainCell.swift
//  ShopList
//
//  Created by Abraao on 20/02/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell, CellConfigurable {

    @IBOutlet weak var lblListName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setup(viewModel: RowViewModel) {
        guard let viewModel = viewModel as? MainCellViewModel else {
            return
        }

        lblListName.text = viewModel.listName
    }
    
}
