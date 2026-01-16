//
//  ViewController.swift
//  saveDate
//
//  Created by GEU on 14/01/26.
//

import UIKit

class ViewController: UIViewController {
    
    struct Note: Codable {
        let title: String
        let text: String
        let timestamp: Date
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let newNote = Note(title: "Hello", text: "Hello World", timestamp: Date())
        let propertyListEncoder = PropertyListEncoder()
        /*if let encodedNote = try? propertyListEncoder.encode(newNote) {
            print(encodedNote)
            let propertyListDecoder = PropertyListDecoder()
            if let decodedNote = try? propertyListDecoder.decode(Note.self, from: encodedNote) {
                print(decodedNote)
            }
        }*/
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveUrl = documentsDirectory.appendingPathComponent("note").appendingPathExtension("plist")
        
        let encodedNote = try? propertyListEncoder.encode(newNote)
        try? encodedNote?.write(to: archiveUrl, options: . noFileProtection)
        
        let propertyListDecoder = PropertyListDecoder()
        if let retriveNoteDate = try? Data(contentsOf: archiveUrl), let decodedNote = try? propertyListDecoder.decode(Note.self, from: retriveNoteDate) {
            print(decodedNote)
            print(archiveUrl)
        }
        
        print(documentsDirectory.path())
        
    }
    

}
