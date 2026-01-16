//
//  ViewController.swift
//  colorMaker
//
//  Created by GEU on 04/09/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var red: UITextField!
    @IBOutlet weak var green: UITextField!
    @IBOutlet weak var blue: UITextField!
    @IBOutlet weak var generatedColour: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func generate(_ sender: Any) {
        var redcolor = Double(red.text ?? "0") ?? 0
        var greencolor = Double(green.text ?? "0") ?? 0
        var bluecolor = Double(blue.text ?? "0") ?? 0
        if redcolor > 255 || greencolor > 255 || bluecolor > 255 || redcolor <= 0 || greencolor <= 0 || bluecolor <= 0 {
            redcolor = Double.random(in: 0...255)
            greencolor = Double.random(in: 0...255)
            bluecolor = Double.random(in: 0...255)
        }
        generatedColour.backgroundColor = UIColor(red: CGFloat(redcolor)/255, green: CGFloat(greencolor)/255, blue: CGFloat(bluecolor)/255, alpha: 1)
    }
    @IBAction func reset(_ sender: Any) {
        red.text = ""
        green.text = ""
        blue.text = ""
        generatedColour.backgroundColor = .white
    }
    
}

