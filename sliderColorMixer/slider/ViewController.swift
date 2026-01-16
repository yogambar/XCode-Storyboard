//
//  ViewController.swift
//  slider
//
//  Created by GEU on 13/10/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var red: UISlider!
    @IBOutlet weak var green: UISlider!
    @IBOutlet weak var blue: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        colorGenerator()
        // Do any additional setup after loading the view.
    }
    fileprivate func colorGenerator() {
        let red = red.value
        let green = green.value
        let blue = blue.value
        view.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
    }
    
    @IBAction func redSlider(_ sender: Any) {
        colorGenerator()
    }
    @IBAction func greenSlider(_ sender: Any) {
        colorGenerator()
    }
    @IBAction func blueSlider(_ sender: Any) {
        colorGenerator()
    }
    
    @IBAction func redSwitch(_ sender: Any) {
        if red.isEnabled {
            red.isEnabled = false
        }
        else {
            red.isEnabled = true
        }
    }
    @IBAction func greenSwitch(_ sender: Any) {
        if green.isEnabled {
            green.isEnabled = false
        }
        else {
            green.isEnabled = true
        }
    }
    @IBAction func blueSwitch(_ sender: Any) {
        if blue.isEnabled {
            blue.isEnabled = false
        }
        else {
            blue.isEnabled = true
        }
    }
    
}

