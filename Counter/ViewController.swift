//
//  ViewController.swift
//  Counter
//
//  Created by Артем Трубицин on 16.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var textLabel: UILabel!
    
    @IBOutlet weak private var titleButton: UIButton!
    private var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = "0"
        textLabel.textAlignment = .center
        titleButton.setTitle("+", for: .normal)
    }
    
    @IBAction private func tapButton(_ sender: Any) {
        counter += 1
        textLabel.text = "Значение счётчика: \(counter)"
    }
}

