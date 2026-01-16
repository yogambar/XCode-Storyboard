//
//  ViewController.swift
//  imageSlider
//
//  Created by GEU on 13/10/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var size: UISlider!
    var orignalSize: CGSize = .zero
    override func viewDidLoad() {
        super.viewDidLoad()
        orignalSize = image.frame.size
        size.value = 50
        updateSize()
        // Do any additional setup after loading the view.
    }

    fileprivate func updateSize() {
        let scale = CGFloat(size.value/50.0)
        let newHeight = orignalSize.height * scale
        let newWidth = orignalSize.width * scale
        let center = image.center
        image.frame.size = CGSize(width: newWidth, height: newHeight)
        image.center = center
    }
    
    @IBAction func sizeSlider(_ sender: Any) {
        updateSize()
    }
    
}
