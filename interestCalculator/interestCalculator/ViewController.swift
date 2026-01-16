//
//  ViewController.swift
//  interestCalculator
//
//  Created by GEU on 04/09/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var principal: UITextField!
    @IBOutlet weak var rate: UITextField!
    @IBOutlet weak var time: UITextField!
    @IBOutlet weak var result: UITextField!
    
    var principalValue: Double = 0
    var rateValue: Double = 0
    var timeValue: Double = 0
    var resultValue: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func simpleInterest(_ sender: Any) {
        principalValue = Double(principal.text ?? "") ?? 0
        rateValue = Double(rate.text ?? "") ?? 0
        timeValue = Double(time.text ?? "") ?? 0
        resultValue = (principalValue * rateValue * timeValue) / 100
        result.text = "\(resultValue)"
    }
    
    @IBAction func compoundInterest(_ sender: Any) {
        principalValue = Double(principal.text ?? "") ?? 0
        rateValue = Double(rate.text ?? "") ?? 0
        timeValue = Double(time.text ?? "") ?? 0
        resultValue = principalValue * pow(1 + (rateValue / 100), timeValue)
        result.text = "\(resultValue)"
    }
    @IBAction func reset(_ sender: Any) {
        principal.text = ""
        rate.text = ""
        time.text = ""
        result.text = ""
    }
    
}

