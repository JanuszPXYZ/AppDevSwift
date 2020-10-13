import UIKit


//for element in 1...4 {
//    print("Score: \(element)")
//}
struct Game {
    var word: String
    var incorrectMovesRemaining: Int
}


var scoreTally: Int = 0
var listOfWords: [String] = ["swift", "bug", "program"]
var buttonsPressed: [Character] = ["w", "f", "s"]
var currentGame = Game(word: listOfWords[0], incorrectMovesRemaining: 5)
//
//for element in listOfWords {
//    for letter in element {
//        if buttonsPressed.contains(letter) {
//            print("\(letter) - Contains")
//        }
//    }
//}

//
//for element in currentGame.word {
//    if buttonsPressed.contains(element) {
//        scoreTally += 1
//    }
//}
//print(scoreTally)

func updateScore() {
    for element in currentGame.word {
        if buttonsPressed.contains(element) {
            scoreTally += 1
        }
    }
    print("Score: \(scoreTally)")
}
updateScore()
