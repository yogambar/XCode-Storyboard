//
//  ViewController.swift
//  counter
//
//  Created by GEU on 04/09/25.
//

import UIKit

class ViewController: UIViewController {

    var isOn: Bool = false
    
    @IBOutlet weak var result: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func incrementCounter(_ sender: Any) {
        if isOn {
            let current = Int(result.text ?? "") ?? 0
            let updated = current + 1
            result.text = "\(updated)"
        }
    }
    @IBAction func decrementCounter(_ sender: Any) {
        if isOn {
            let current = Int(result.text ?? "") ?? 0
            let updated = current - 1
            result.text = "\(updated)"
        }
    }
    @IBAction func start(_ sender: Any) {
        if !isOn {
            isOn.toggle()
        }
    }
    @IBAction func stop(_ sender: Any) {
        if isOn {
            isOn.toggle()
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        result.text = "0"
    }
    
}

