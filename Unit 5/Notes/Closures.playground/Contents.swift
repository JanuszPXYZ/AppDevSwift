import UIKit


// C L O S U R E S
// The syntax of a closure is a bit tricky, so let's pace ourselves and start with something simple. We said that a closure is a self-contained block of functionality, just as function is. Let's define a sample function that will serve as a starting point.

func sum(numbers: [Int]) -> Int {
    var total = 0
    for number in numbers {
        total += number
    }
    return total
}

let summationFunc = sum(numbers: [1,2,3,4])
print(summationFunc)

// Okay, great. Now let's do the same but using a closure

let sumClosure = { (numbers: [Int]) -> Int in
    var total = 0
    for number in numbers {
       total += number
    }
    return total
}

let sumUsingaClosure = sumClosure([1,2,3,4])
print(sumUsingaClosure)

// For a closure, you add the in keyword to indicate that we're now entering the code to be executed when calling the closure. We can then use the closure to perform the action by calling the sumClosure

// Because all values in Swift must have a type, closures HAVE A TYPE. We define the type by specifying a parameter list and a return type, or the lack of either, at the start of the block of code. Just like functions, there are four types of closures.

// 1. A closure with NO parameters and NO return value
let printClosure = { () -> Void in
    print("This closure does not take any parameters and returns no value...")
}

// 2. A closure with parameters and no return value
let printClosureWithParams = { (string: String) -> Void in
    print(string)
}
//let anotherTest = printClosureWithParams("Nothing")

// 3. A closure with no parameters and a return value
let randomNumberClosure = { () -> Int in
    return Int.random(in: 0...10)
}
let random = randomNumberClosure()
print(random)

// 4. A closure with parameters and a return value (just like the one we worked with in the beginning of this section)

let randomNumberClosureTwo = { (minValue: Int, maxValue: Int) -> Int in
    return Int.random(in: minValue...maxValue)
}

// PASSING CLOSURES AS ARGUMENTS
struct Track {
    enum StarRating {
        case one, two, three, four, five
    }
    
    var trackName: String
    var trackNumber: Int
    var starRating: StarRating
}

let trackOne = Track(trackName: "Come As You Are", trackNumber: 1, starRating: .five)
let trackTwo = Track(trackName: "Faster Car", trackNumber: 6, starRating: .five)
let trackThree = Track(trackName: "Party In The U.S.A.", trackNumber: 4, starRating: .two)
let tracks: [Track] = [trackOne, trackTwo, trackThree]

let sortedTracks = tracks.sorted { (firstTrack, secondTrack) -> Bool in
    return firstTrack.trackNumber < secondTrack.trackNumber
}

for song in sortedTracks {
    print("\(song.trackName) - \(song.trackNumber)")
}

// ADDITIONAL SYNTACTIC SUGAR
// The Swift compiler is very smart. Because it knows the types of every constant, variable, and closure, it can make assumptions that allow you to write more concise code. Swift allows you to combine type safety with closure syntax to help you move from syntax-heavy statements to very simple, concise statements. Having said that, we can simplify the code in the sortedTracks even more.

// Swift can infer that the closure must return a Bool value, so we can remove the return type

let sugarySorted = tracks.sorted { (track1, track2) in
    return track1.trackName < track2.trackName
}
// Because the sorted function expects two instances to compare, Swift knows that you need to pass the closure two tracks, therefore the compiler provides a placeholder names for the closure parameters that you can use instead. Placeholder names begin with $ followed by the index of the parameter. So you can access the first parameter using $0, the second using $1, and so on. Now you can drop the parameter names:

let evenMoreSugary = tracks.sorted { return $0.trackName < $1.trackName}

// When a closure has one line, Swift will automatically return the result, so you can remove the return keyword.

