//
//  ViewController.swift
//  Counter
//
//  Created by Артем Трубицин on 16.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var titleButton: UIButton!
    var counter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textLabel.text = "0"
        textLabel.textAlignment = .center
        
    }

    @IBAction func tapButton(_ sender: Any) {
            counter += 1
            textLabel.text = "Значение счётчика: \(counter)"
        
    }
    
    
}

