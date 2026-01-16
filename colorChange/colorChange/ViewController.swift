//
//  ViewController.swift
//  colorChange
//
//  Created by GEU on 27/08/25.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIColor()
        // Do any additional setup after loading the view.
    }

    fileprivate func UIColor () {
        if view.backgroundColor == .systemRed {
            view.backgroundColor = .systemGreen
        }
        else if view.backgroundColor == .systemGreen {
            view.backgroundColor = .systemBlue
        }
        else {
            view.backgroundColor = .systemRed
        }
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        UIColor()
    }
    
}

