//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    //var itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]
    var itemArray = [Item(title: "Find Mike"), Item(title: "Buy Eggos"), Item(title: "Destroy Demogorgon")]
    
    
    let defaults = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
//            itemArray = items
//        }
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
    }
    
    //MARK: - Table View Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        //let cell = UITableViewCell(style: .default, reuseIdentifier: "ToDoItemCell")

        cell.textLabel?.text = itemArray[indexPath.row].title
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let check = tableView.cellForRow(at: indexPath)
//        if let c = check {
//            c.accessoryType = c.accessoryType == .checkmark ? .none : .checkmark
//        }
        if let c = check {
            if c.accessoryType == .checkmark {
                c.accessoryType = .none
                itemArray[indexPath.row].done = false
                print(itemArray)
            } else {
                c.accessoryType = .checkmark
                itemArray[indexPath.row].done = true
                print(itemArray)
            }
        }
        
        
    }

    //MARK: - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks the Add Item button on our UIAlert
            print("success!")
            
            if let text = textField.text {
                //self.itemArray.append(text)
                self.itemArray.append(Item(title: text))
                
                //self.defaults.set(self.itemArray, forKey: "TodoListArray")
                self.tableView.reloadData()
            }
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
