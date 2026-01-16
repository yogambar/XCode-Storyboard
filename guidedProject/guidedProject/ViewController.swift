//
//  ViewController.swift
//  guidedProject
//
//  Created by GEU on 26/08/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    var lightOn = true
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }

    fileprivate func updateUI () {
        /*if lightOn {
            view.backgroundColor = .white
            //lightButton.setTitle( "Light Mode", for: .normal)
        }
        else    {
            view.backgroundColor = .black
            //lightButton.setTitle( "Dark Mode", for: .normal)
        }*/
        
        view.backgroundColor = lightOn ? .white : .black
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        lightOn.toggle()
        updateUI ()
    }
    
    @IBAction func addition(_ sender: Any) {
        label.text = (label.text ?? "") + "+"
    }
    
    @IBAction func subtraction(_ sender: Any) {
        label.text = (label.text ?? "") + "-"
    }
    
    @IBAction func multiplication(_ sender: Any) {
        label.text = (label.text ?? "") + "*"
    }
    
    @IBAction func division(_ sender: Any) {
        label.text = (label.text ?? "") + "/"
    }
    
    @IBAction func one(_ sender: Any) {
        label.text = (label.text ?? "") + "1"
        resultLabel.text = calculate()
    }
    
    @IBAction func two(_ sender: Any) {
        label.text = (label.text ?? "") + "2"
        resultLabel.text = calculate()
    }
    
    @IBAction func three(_ sender: Any) {
        label.text = (label.text ?? "") + "3"
        resultLabel.text = calculate()
    }
    
    @IBAction func four(_ sender: Any) {
        label.text = (label.text ?? "") + "4"
        resultLabel.text = calculate()
    }
    
    @IBAction func five(_ sender: Any) {
        label.text = (label.text ?? "") + "5"
        resultLabel.text = calculate()
    }
    
    @IBAction func six(_ sender: Any) {
        label.text = (label.text ?? "") + "6"
        resultLabel.text = calculate()
    }
    
    @IBAction func seven(_ sender: Any) {
        label.text = (label.text ?? "") + "7"
        resultLabel.text = calculate()
    }
    
    @IBAction func eight(_ sender: Any) {
        label.text = (label.text ?? "") + "8"
        resultLabel.text = calculate()
    }
    
    @IBAction func nine(_ sender: Any) {
        label.text = (label.text ?? "") + "9"
        resultLabel.text = calculate()
    }
    
    @IBAction func zero(_ sender: Any) {
        label.text = (label.text ?? "") + "0"
        resultLabel.text = calculate()
    }
    
    @IBAction func clear(_ sender: Any) {
        resultLabel.text = "0"
        label.text = "0"
    }
    
    func calculate() -> String {
        guard let text = label.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              !text.isEmpty else {
            return "Error"
        }
        
        var expr = text
        while let last = expr.last, ["+", "-", "*", "/", " "].contains(last) {
            expr.removeLast()
        }
        expr = expr.replacingOccurrences(of: " ", with: "")
        
        let expression = NSExpression(format: expr)
        if let value = expression.expressionValue(with: nil, context: nil) as? NSNumber {
            return "\(value)"
        } else {
            return label.text ?? "Error"
        }
    }
    @IBAction func result(_ sender: Any) {
        label.text = resultLabel.text
        resultLabel.text = ""
    }
}

