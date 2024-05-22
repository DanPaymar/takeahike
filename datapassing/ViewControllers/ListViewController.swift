//
//  ListViewController.swift
//  datapassing
//
//  Created by Daniel Paymar on 5/17/24.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addCustomButton: UIBarButtonItem!
    
    @IBAction func addCustomButton(_ sender: Any) {
        showAddItem()
    }
    
    var user: User
    var essentials: [Essential] = []
    
    init(coder: NSCoder, user: User) {
        self.user = user
        
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var datasource: [Essential] = [
        Essential(itemName: "Backpack", itemType: .base),
        Essential(itemName: "Water bottle", itemType: .base),
        Essential(itemName: "Wind jacket", itemType: .base)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.categoryReuseID)
        title = "Select Gear"
    }
    
    private func showAddItem() {
        let alertController = UIAlertController(title: "Add Custom Item", message: "Type in your item here", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "Item name"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self] _ in
            
            
            guard let code = alertController.textFields?[0].text else { return }
            
        }
        
        // Add actions to the alert controller
        alertController.addAction(cancelAction)
        alertController.addAction(submitAction)
        
        // Present the alert controller
        present(alertController, animated: true, completion: nil)
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.categoryReuseID, for: indexPath) as! MessageCell
        let essential = datasource[indexPath.row]
        cell.cellLabel.text = essential.itemName
        // configure the table cell
//        var content = cell.defaultContentConfiguration()
//        content.text = essential.itemName
//        
//        cell.contentConfiguration = content

        return cell
    }
    
    
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEssential = datasource[indexPath.row]
        
        user.kitItems.append(selectedEssential)
        

    }
}
