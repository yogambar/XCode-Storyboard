//
//  ViewController.swift
//  introduction
//
//  Created by GEU on 25/08/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var universityTextField: UITextField!
    @IBOutlet weak var semesterTextField: UITextField!
    @IBOutlet weak var courseTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeInformation(_ sender: Any) {
        nameTextField.text = "Yogambar Singh"
        courseTextField.text = "B.tech"
        semesterTextField.text = "5"
        universityTextField.text = "GEU"
    }
    
}

