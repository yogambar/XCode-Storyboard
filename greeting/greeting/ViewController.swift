//
//  ViewController.swift
//  greeting
//
//  Created by GEU on 25/08/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greetingTextField: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveInformation(_ sender: Any) {
        greetingTextField.text = "Hello, \(nameTextField.text ?? "")!"
    }
}

