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

let totalSugar = tracks.sorted { $0.trackName < $1.trackName }

// TRAILING CLOSURE SYNTAX

func performRequest(url: String, response: (_ code: Int) -> Void) {
}

// Here's how we would call the function above
performRequest(url: "https://www.apple.com") { (data) in
    print(data)
}


// COLLECTION FUNCTIONS USING CLOSURES
// Swift includes some advanced functions for iterating over collections and performing common actions. We'll learn about map, which allows us to transform an array of one type into an array of another type by transforming each value in the collection. We'll learn about filter, which creates a new array of only the objects that meet our defined set of rules. And we'll also learn about reduce, which lets us combine many values into a single one.

// For starters, M A P function

let names: [String] = ["Johnny", "Nellie", "Aaron", "Rachel"]
var fullNames: [String] = []

for name in names {
    let full = name + " Smith"
    fullNames.append(full)
}
print(fullNames)
// We could of course use a for loop to create an array of full names, but there's a more clever way: the map function. The closure will be executed on each object in the firstNames array to create what will be added to the fullNames array
let fullNamesClosure = names.map { (name) -> String in
    return name + " Smith"
}
print(fullNamesClosure)

// A shortened version of the map function works as well. Recall that $0 is just a placeholder for the current object in the array

let fullNamesSugar = names.map { $0 + " Smith" }
fullNamesSugar

// Closure syntax can be difficult. It's helpful to pause and break down the syntax of each example. Try to identify the:
// 1. function call -> map()
// 2. closure parameter -> The code in the curly braces {}
// 3. $0 argument -> The individual object in the array that's being worked with.

// FILTER function

let numbers: [Int] = [4, 8, 15, 16, 23, 42]
var numbersLessThan20: [Int] = []

for number in numbers {
    if number < 20 {
        numbersLessThan20.append(number)
    }
}

// And here's the filter function (two versions of it: one being more explicit, and the other succinct)
let explicitNums = numbers.filter { (number) -> Bool in
    number < 20
}

let filteredNums = numbers.filter { $0 < 20 }


// REDUCE function
// The reduce function combines all of the values in an array into one value. It takes a starting value and a closure that dictates how to combine the items. The code in this example takes an array of numbers and adds them together.

// Here's one potential solution

let anotherSetOfNumbers: [Int] = [8, 6, 7, 5, 3, 0, 9]
var total: Int = 0

for number in anotherSetOfNumbers {
    total += number
}
print(total)

// And another solution using the reduce function

let reduceTotal = anotherSetOfNumbers.reduce(0) { (currentTotal, newValue) -> Int in
    return currentTotal + newValue
}














