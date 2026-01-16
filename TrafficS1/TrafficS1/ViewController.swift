//
//  ViewController.swift
//  TrafficS1
//
//  Created by GEU on 06/11/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToRed(unwindSegue: UIStoryboardSegue){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = redTextField.text
    }

}

