//
//  ShoppingListDetailViewController.swift
//  ShopList
//
//  Created by Abraao Levi on 08/06/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var shoppingList: ShoppingList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = shoppingList?.name
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .compose, target: nil, action: nil)
        ]
    }
    
}
