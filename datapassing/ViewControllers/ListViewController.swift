//
//  ListViewController.swift
//  datapassing
//
//  Created by Daniel Paymar on 5/17/24.
//

import UIKit

//protocol ListViewControllerDelegate: AnyObject {
//    func didUpdateItems()
//}

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addCustomButton: UIBarButtonItem!
    // pass the user to the list view
    var user: User
    
    init(coder: NSCoder, user: User) {
        self.user = user
        
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.categoryReuseID)
        title = "Select Gear"
    }
    
    @IBAction func addCustomButton(_ sender: Any) {
        showAddItem()
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
        // returns the users datasource essential objects array
        return user.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.categoryReuseID, for: indexPath) as! MessageCell
        let item = user.datasource[indexPath.row]
        // configure the table cell
        cell.item = item
        // assign the item name to the cell label
        cell.cellLabel.text = item.itemName
        // assign the item count from stepper to the stepper value
        cell.cellStepper.value = Double(item.count)
        // assign the item count to the cell count label
        cell.countLabel.text = String(item.count)

        return cell
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        var section = user.datasource
//        
//        return "\(section)"
//    }
//    
    
}

extension ListViewController: UITableViewDelegate {

}
