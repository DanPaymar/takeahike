//
//  StartViewController.swift
//  datapassing
//
//  Created by Daniel Paymar on 5/17/24.
//

import UIKit

class StartViewController: UIViewController {
    // intiliaze a new user
    var user = User()
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var startViewLabel: UILabel!
    
    
    
    @IBAction func startButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToList", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        setupStartLabel()
        view.backgroundColor = .secondarySystemBackground
    }
    
    func setupButton() {
        startButton.setTitle("Kit List", for: .normal)
        startButton.tintColor = .green
    }
    func setupStartLabel() {
        startViewLabel.text = "Take a Hike"
        startViewLabel.textColor = .systemGray2
        startViewLabel.font = .systemFont(ofSize: 44, weight: .heavy)
    }
}
