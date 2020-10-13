//
//  ViewController.swift
//  ApplePie
//
//  Created by Janusz Polowczyk on 28/09/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var listOfWords: [String] = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program"]
    let incorrectMovesAllowed: Int = 7
    let guessedWord: Int = 5
    var totalWins: Int = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses: Int = 0 {
        didSet {
            newRound()
        }
    }
    
    var currentGame: Game!
    
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet var scoreBoard: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateUI()
        updateGameState()
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }
    
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func updateUI() {
        var letters = [String]()
        letters = currentGame.formattedWord.map {String($0)}
//        for letter in currentGame.formattedWord {
//            letters.append(String(letter))
//        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins : \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        updateScore()
    }
    
    func updateScore() {
        var scoreTally: Int = 0
        scoreBoard.text = "Score: \(scoreTally)"
        
        for letter in currentGame.word {
            if currentGame.formattedWord.contains(letter) {
                scoreTally += 1
            }
            scoreBoard.text = "Score: \(scoreTally)"
        }
    }
//DOOOONE!
}

