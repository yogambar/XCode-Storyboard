//
//  gameStruct.swift
//  ApplePie
//
//  Created by Rishika Mittal on 31/10/25.
//

import Foundation

struct Game{
    var word: String
    var incorrectRemaining: Int
    var guessedLetters: [Character]
    
    mutating func playerGuessed(_ letter: Character){
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectRemaining -= 1
        }
    }
    
    var formttedWord: String{
        var guessedWord = ""
        for letter in word{
            if guessedLetters.contains(letter){
                guessedWord += "\(letter)"
            }else{
                guessedWord += "_"
            }
        }
        return guessedWord
    }
}
