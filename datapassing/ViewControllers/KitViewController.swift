//
//  KitViewController.swift
//  datapassing
//
//  Created by Daniel Paymar on 5/20/24.
//

import UIKit


class KitViewController: UIViewController {
    
    let user = User()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTable()
        title = "Gear"
    }
    // initialize a new empty array of essential objects assigned to tableItems
    var tableItems = [Essential]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // assign the Users user table items to the table item row
        tableItems = User.userTableItems(user: user)
        // reload the data of the table view
        tableView.reloadData()
        
        setupContentUnavailableConfig()
        
    }
    
    @IBSegueAction func plusButtonTapped(_ coder: NSCoder) -> ListViewController? {
        return ListViewController(coder: coder, user: user)
        
    }
    
    func initializeTable() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupContentUnavailableConfig() {
        if tableItems.count == 0 {
            var config = UIContentUnavailableConfiguration.empty()
            
            config.image = UIImage(systemName: "figure.hiking")
            config.text = "You don't have any gear"
            config.secondaryText = "Add items and get hiking"
            self.contentUnavailableConfiguration = config
        } else {
            self.contentUnavailableConfiguration = nil
        }
    }
    
}


extension KitViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // if no table items are in the essential array no table cells will appear
        return tableItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.categoryReuseID, for: indexPath)
        // setup the table cell
        
        let kitItem = tableItems[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = "\(kitItem.count) \(kitItem.itemName)"
        content.secondaryText = "\(kitItem.itemType)"
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            print("deleted")
            self.tableItems.remove(at: indexPath.row)
            let resetListVC = user.datasource[indexPath.row]
            resetListVC.count = 0
            
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            self.tableView.endUpdates()
            setupContentUnavailableConfig()
            
        }
        
    }
}

