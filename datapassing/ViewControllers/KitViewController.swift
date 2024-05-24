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
//        didSet { // automatically calls updateContentUnavailableView whenever value of table items changes
//            updateContentUnavailableView()
//        }
//    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           if tableItems.count == 0 {
               var config = UIContentUnavailableConfiguration.empty()
               
               config.image = UIImage(systemName: "figure.hiking")
               config.text = "You don't have any gear"
               config.secondaryText = "Add items and get hiking"
               self.contentUnavailableConfiguration = config
           } else {
               // assign the users table items to table items
               tableItems = User.userTableItems(user: user)
               tableView.reloadData()
           }
     
       }
    
    @IBSegueAction func plusButtonTapped(_ coder: NSCoder) -> ListViewController? {
        return ListViewController(coder: coder, user: user)
        
    }
    
    func initializeTable() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
//    // Function to update the content unavailable view
//        private func updateContentUnavailableView() {
//            if tableItems.isEmpty {
//                var config = UIContentUnavailableConfiguration.empty()
//                config.image = UIImage(systemName: "figure.hiking")
//                config.text = "You don't have any gear"
//                config.secondaryText = "Add items and get hiking"
//                tableView.backgroundView = nil // Remove any existing background view
//                tableView.separatorStyle = .none // Hide separators
//                tableView.backgroundView = UIView(frame: tableView.bounds) // Set up a background view
//                tableView.backgroundView?.backgroundColor = .systemBackground // Set background color
////                self.tableView.backgroundView?.addSubview(UILabel(text: "No data")) // Add a label
//            } else {
//                tableView.backgroundView = nil // Remove content unavailable view
//                tableView.separatorStyle = .singleLine // Restore separators
//            }
//        }
    
}


extension KitViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // if the no table items are in the essential array no table cells will appear
        return tableItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.categoryReuseID, for: indexPath)
        // setup the table cell
        
            let kitItem = tableItems[indexPath.row]
            var content = cell.defaultContentConfiguration()
            
            content.text = "\(kitItem.count) \(kitItem.itemName)"
            cell.contentConfiguration = content
//            tableView.rowHeight = 40
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("deleted")
            self.tableItems.remove(at: indexPath.row)
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.endUpdates()
        }
    }
}

