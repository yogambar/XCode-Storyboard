//
//  ResultViewController.swift
//  BMI
//
//  Created by GEU on 15/01/26.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!

    var bmiValue: Float = 0.0
    var bmiMessage: String = ""
    var bmiColor: UIColor = .white

    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = String(format: "%.1f", bmiValue)
        resultLabel.text = bmiMessage
        view.backgroundColor = bmiColor

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
