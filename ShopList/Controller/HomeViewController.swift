//
//  HomeViewController.swift
//  ShopList
//
//  Created by Abraao Levi on 25/05/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newListButton: UIButton!
    
    var shoppingLists = [ShoppingList]()
    let shoppingListRepo = ShoppingListRepository.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Home"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        shoppingLists = shoppingListRepo.getAll()
        tableView.reloadData()
    }
    
    @IBAction func newListButtonTapped(_ sender: Any) {
        let viewController = UINavigationController(rootViewController: ShoppingListAddViewController())
        self.present(viewController, animated: true, completion: nil)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let shoppingList = shoppingLists[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = shoppingList.name
        cell.detailTextLabel?.text = shoppingList.place?.name
        cell.accessoryType = shoppingList.isDone ? .checkmark : .disclosureIndicator
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

