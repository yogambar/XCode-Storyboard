//
//  ViewController.swift
//  dayLeft
//
//  Created by GEU on 05/01/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var days: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculate(_ sender: Any) {
        date.minimumDate = Date()
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: Date())
        let endOfDay = calendar.startOfDay(for: date.date)
        let components = calendar.dateComponents([.day], from: startOfDay, to: endOfDay)
        days.text = "\(components.day ?? 0)"
    }
    
}

