//
//  ViewController.swift
//  rainbowTabbar
//
//  Created by GEU on 03/12/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        print("View Controller-Did Load First VC")
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("View Controller-Did Disappear First VC")
        super.viewDidDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("View Controller-Will Appear First VC")
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("View Controller-Did Appear First VC")
        super.viewDidAppear(animated)
    }

}

