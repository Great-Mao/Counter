//
//  ViewController.swift
//  Counter
//
//  Created by Артем Трубицин on 16.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var textLabel: UILabel!
    
    @IBOutlet weak var historyTextView: UITextView!
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    fileprivate enum ChangeString: String {
        case change = "Значение измененно на"
        case reset = "Значение сброшенно"
        case negativeDecrement = "попытка уменьшить значение счётчика ниже 0"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = "0"
        textLabel.textAlignment = .center
        plusButton.setTitle("✚", for: .normal)
        plusButton.tintColor = .red
        minusButton.setTitle("−", for: .normal)
        minusButton.tintColor = .blue
        resetButton.setTitle("♺", for: .normal)
        resetButton.tintColor = .green
    }
    
    
    private func getCurrentDateString() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        
        return dateFormatter.string(from: date)
    }
    
    
    private func setHistory(with string: ChangeString, and value: String? = nil)  {
        guard let historyText = historyTextView.text else { return }
        let date = getCurrentDateString()
        
        historyTextView.text = "\(historyText) \n [\(date)]: \(string.rawValue) \(value ?? "")"
    }
    
    
    @IBAction private func plusButton(_ sender: Any) {
        guard let text = textLabel.text, let count = Int(text)  else { return }
        
        textLabel.text = String(count + 1)
        setHistory(with: .change, and: "+1")
    }
    
    
    @IBAction private func minusButton(_ sender: Any) {
        if (textLabel.text == "0") {
            setHistory(with: .negativeDecrement)
            return
        }
        
        guard let text = textLabel.text, let count = Int(text)  else { return }
        
        textLabel.text = String(count - 1)
        setHistory(with: .change, and: "-1")
    }
    
    
    @IBAction private func resetCount(_ sender: Any) {
        textLabel.text = "0"
        setHistory(with: .reset)
    }
}

