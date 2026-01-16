//
//  ViewController.swift
//  calculateAge
//
//  Created by GEU on 29/09/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dob: UIDatePicker!
    @IBOutlet weak var ageTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func calculateAge(_ sender: Any) {
        ageTextField.text = "\(calculateAge(dob.date))"
    }
    func calculateAge(_ dateOfBirth: Date) -> Int {
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: dateOfBirth, to: Date())
        return ageComponents.year!
    }
}

