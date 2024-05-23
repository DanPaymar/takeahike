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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }
    
    @IBSegueAction func plusButtonTapped(_ coder: NSCoder) -> ListViewController? {
        return ListViewController(coder: coder, user: user)
    }
    
    func initializeTable() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension KitViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        user.datasource.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.categoryReuseID, for: indexPath)

        let kitItem = user.datasource[indexPath.row]
        
        if kitItem.count == 0 {
            print("table cells have zero values")
            
        } else {
            var content = cell.defaultContentConfiguration()
            
            content.text = "\(kitItem.count) \(kitItem.itemName)"
            cell.contentConfiguration = content
            
            return cell
        }
        return cell
    }
    
}

