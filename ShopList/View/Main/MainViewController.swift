//
//  MainViewController.swift
//  ShopList
//
//  Created by Abraao Levi on 16/02/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    private var lists: [String] = []
    
    // MARK: Life cicly
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)

        cell.textLabel?.text = lists[indexPath.row]
        
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            lists.remove(at: indexPath.row)

            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
 

    // MARK: - Action handlers
    
    @IBAction func onTapAddButton(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Add new List", message: nil, preferredStyle: .alert)
        
        var alertTextField = UITextField()
        alertController.addTextField {
            (textField) in
            alertTextField = textField
            alertTextField.placeholder = "List name"
        }

        let addAction = UIAlertAction(title: "Add", style: .default) {
            (action) in
            if let listName = alertTextField.text {
                self.lists.append(listName)
                self.tableView.reloadData()
            }
        }
        alertController.addAction(addAction)
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
