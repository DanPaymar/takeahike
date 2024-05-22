//
//  MessageCell.swift
//  datapassing
//
//  Created by Daniel Paymar on 5/22/24.
//

import UIKit

class MessageCell: UITableViewCell {
    
    @IBOutlet weak var cellRow: UIView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellStepper: UIStepper!
    
    @IBOutlet weak var countLabel: UILabel!
    
    var item: Essential?
    
    @IBAction func cellStepper(_ sender: UIStepper) {
        item?.count = Int(sender.value)
        
        countLabel.text = "\(Int(sender.value))"
        
    }
    
}
