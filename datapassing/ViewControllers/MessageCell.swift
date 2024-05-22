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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func cellStepper(_ sender: UIStepper) {
        countLabel.text = "\(Int(sender.value))"
        
    }
    
}
