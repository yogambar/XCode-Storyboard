//
//  ViewController.swift
//  uiKitView
//
//  Created by GEU on 15/09/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //create UI view
        let boxView = UIView(frame:CGRect(x:100, y:300, width:200, height:200))
        boxView.backgroundColor = .red
        view.addSubview(boxView)
        
        let myText = UILabel(frame:CGRect(x: 150, y: 300, width: 200, height: 200))
        myText.text = "Yogambar Singh"
        view.addSubview(myText)
    }


}

