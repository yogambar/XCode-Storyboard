//
//  ViewController.swift
//  BMI
//
//  Created by GEU on 15/12/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    
    var bmiValue: Float = 0.0
    var bmiColor: UIColor = .white
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
        bmiCalculation()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightChanged(_ sender: UISlider) {
        updateLabels()
        bmiCalculation()
    }

    @IBAction func weightChanged(_ sender: UISlider) {
        updateLabels()
        bmiCalculation()
    }
    
    func updateLabels() {
        heightLabel.text = String(format: "%.2f m", heightSlider.value)
        weightLabel.text = "\(Int(weightSlider.value)) kg"
    }
    
    fileprivate func bmiCalculation() {
        let height = heightSlider.value
        let weight = weightSlider.value
        bmiValue = weight / (height * height)
        bmiLabel.text = "\(bmiValue)"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        bmiCalculation()
        if bmiValue < 18.5 {
            performSegue(withIdentifier: "Underweight", sender: self)
        } else if bmiValue < 24.9 {
            performSegue(withIdentifier: "Healthy", sender: self)
        } else {
            performSegue(withIdentifier: "Overweight", sender: self)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! ResultViewController
        destinationVC.bmiValue = bmiValue
        
        if segue.identifier == "Underweight" {
            destinationVC.bmiMessage = "You're Underweight!"
            destinationVC.bmiColor = UIColor.systemYellow
        }
        else if segue.identifier == "Healthy" {
            destinationVC.bmiMessage = "You're Healthy!"
            destinationVC.bmiColor = UIColor.systemGreen
        }
        else if segue.identifier == "Overweight" {
            destinationVC.bmiMessage = "You're Overweight!"
            destinationVC.bmiColor = UIColor.systemRed
        }
    }
    
}

