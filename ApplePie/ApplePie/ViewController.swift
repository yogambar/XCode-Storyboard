//
//  ViewController.swift
//  ApplePie
//
//  Created by Rishika Mittal on 31/10/25.
//

import UIKit

class ViewController: UIViewController {

    var listOfWords = ["cake", "chocolate", "icecream", "brownie"]
    let incorrectMovesAllowed = 7
    var totalWins = 0
    var totalLosses = 0
    @IBOutlet weak var treeImage: UIImageView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet var allAplhabets: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }

    var currentGame:Game!
    var totalWin = 0{
        didSet{
            newRound()
        }
    }
    var totalLoss = 0{
        didSet{
            newRound()
        }
    }
    
    @IBAction func aplhabetPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter)
        updateGameState()
        updateUI()
    }
    
    func newRound(){
        if !listOfWords.isEmpty{
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord,incorrectRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        }else{
            enableLetterButtons(false)
        }
    }
    func enableLetterButtons(_ enabled:Bool){
        for button in allAplhabets{
            button.isEnabled = enabled
        }
    }
    
    func updateUI(){
        var letters = [String]()
        for letter in currentGame.formttedWord{
            letters.append(String(letter))
        }
        wordLabel.text = letters.joined(separator: " ")
        score.text = "Win: \(totalWin), Losses: \(totalLoss)"
        treeImage.image = UIImage(named: "Tree \(currentGame.incorrectRemaining)")
    }
    
    func updateGameState(){
        if currentGame.incorrectRemaining == 0{
            totalLoss += 1
        } else if currentGame.word == currentGame.formttedWord{
            totalWin += 1
        }else{
            updateUI()
        }
    }
}

