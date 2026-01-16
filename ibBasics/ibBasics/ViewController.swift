//
//  ViewController.swift
//  ibBasics
//
//  Created by GEU on 25/08/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeTheLocation(_ sender: Any) {
        textField.text = "I am in Graphic Era University"
    }
    
}

