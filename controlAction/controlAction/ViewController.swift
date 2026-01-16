//
//  ViewController.swift
//  controlAction
//
//  Created by GEU on 13/10/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var moodIs: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        moodIs.text = "😎"
        // Do any additional setup after loading the view.
    }

    @IBAction func mode(_ sender: Any) {
        if slider.isEnabled {
            view.backgroundColor = UIColor.black
            slider.isEnabled = false
        } else {
            view.backgroundColor = UIColor.white
            slider.isEnabled = true
        }
    }
    fileprivate func genrate() {
        let slideValue = Int(round(slider.value))
        if slideValue == 0 {
            moodIs.text = "😭"
        }
        else if slideValue == 1 {
            moodIs.text = "😒"
        }
        else if slideValue == 2 {
            moodIs.text = "😃"
        }
        else if slideValue == 3 {
            moodIs.text = "😆"
        }
        else if slideValue == 4 {
            moodIs.text = "😂"
        }
        else if slideValue == 5 {
            moodIs.text = "🤣"
        }
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
            genrate()
    }
    
    @IBAction func button(_ sender: Any) {
        slider.value = 0
    }
}

