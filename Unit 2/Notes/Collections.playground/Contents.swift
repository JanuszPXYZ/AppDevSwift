import UIKit

// Lesson 2.5: COLLECTIONS -> A collection allows us to reference multiple objects at once. For example, we could handle a dozen eggs in one constant instead of 12 separate constants.

// Swift defines two collection types you will frequently work with: A R R A Y S  and  D I C T I O N A R I E S


// ARRAYS -> It is the most common collection type in Swift. It stores an ordered list of same-typed values. When you declare an array, you can specify what type of values will be held in the collection, or you can let the type inference system discover the type.

var names: [String] = ["Anne", "Gary", "Keith"]

// We could easily define the above list as names = ["Anne", ...]. However, there are situations when you want to be more specific with the array's type even though type inference can discover it. Imagine, for example, you want a collection of 8-bit integers (numbers between -127 and 128). You begin by assigning a variabler to the following collection of numbers
var numbers = [1, -3, 50, 72, -95, 115]

// Swift will infer the values to be of type Int and set the numbers to be an array of integers, or [Int]. While this reference is certainly correct, there's a problem: An Int can hold positive and negative numbers that exceed beyond the range from -127 to 128. To help Swift understand that you want to restrict the array to smaller integers, you can specify the type as [Int8], an array of 8-bit integers whose values are restricted to the aforementioned range.

var numbers8Bit: [Int8] = [1, -3, 50, 72, -95, 115]

// What if you tried to include a larger number, such as 300, in an array literal of type [Int8]? Swift will return an error because 300 is greater than the maximum number for an Int8. You should specify the type if the inferred type is not specific enough, and it will help restrict the values that you don't want to allow.

let newNumbers: [Int8] = [4,5,6]
if newNumbers.contains(5) {
    print("There is a 5")
}

// When defining an array as a let constant, we cannot add, remove, or modify any items within the collection.

// ARRAY TYPES

var myArray: [Int] = []

// less common approach to defining empty arrays
var mySecondArray: Array<Int> = []

// Third way of defining empty arrays
var myThirdArray = [Int]()

// WORKING WITH ARRAYS
var myRepeatingArray = [Int](repeating: 0, count: 100)
//for i in 0..<10 {
//    print(myRepeatingArray[i])
//}

let count = myArray.count
if myArray.isEmpty {
    print("No objects in an array!")
}


let firstName = names[0]
names[1] = "Paul" // Initially the second name was "Gary"
print(names)

var newNames = ["Amy"]
newNames.append("Joe")
newNames += ["Keith", "Jane"]
print(newNames)
newNames.insert("Bob", at: 4)
print(newNames)

let keith = newNames.remove(at: 2)
let bob = newNames.removeLast()
newNames.removeAll()

// What about arrays within an array?

let array1: [Int8] = [1,2,3]
let array2: [Int8] = [4,5,6]
let containerArray = [array1, array2]
let firstArray = containerArray[0]
let firstElement = containerArray[0][0]
//for array in containerArray {
//    for element in array {
//        print(element)
//    }
//}


// DICTIONARIES -> Swift dictionary is a list of keys, each with an associated value. Each key must be unique, just like each word in the dictionary is unique. And just as an English dictionary is in alphabetical order to make the words easy to look up, a Swift dictionary is optimized to make key lookups very fast. You define a dictionary using a dictionary literal: a list of comma-separated key/value pairs surrounded by square brackets: [key1: value1, key2: value2, key3: value3]. Just like with arrays, the type can be either inferred, or defined prior to setting a dictionary filled with values (i.e. either [String: Int], or Dictionary<String, Int>

var scores = ["Richard": 500, "Luke": 400, "Cheryl": 800]

// ways of defining dictionaries:

//var myDictionary = [String: Int]()
//var myDictionary = Dictionary<String, Int>
//var myDictionary: [String: Int] = [:]

// ADD/REMOVE/MODIFY A DICTIONARY -> Subscript syntax is particularly handy with a dictionary. Since the ORDER IN A SWIFT DICTIONARY DOESN'T MATTER, THERE'S NO INDEX AND THERE'S NO RISK OF SUBSCRIPTING ERRORS ASSOCIATED WITH INDICES.
// The following example adds a new score to the dictionary of high scores. If the key "Oli" already exists in the dictionary, this code will replace the old value with the new one:
scores["Oli"] = 399

// But what if you want to know if there's an old value in the dictionary BEFORE replacing it? You can use .updateValue(_:, forKey:) to update the dictionary, and the value returned from the method will be equal to the old value, if one existed. In the following example, oldValue will be equal to Richard's old value before the update. If there was no value, oldValue will be nil.
//let oldValue = scores.updateValue(100, forKey: "Richard")

// Swift uses if-let syntax TO LET YOU RUN CODE  O N L Y  IF A VALUE IS RETURNED FROM THE METHOD. If there wasn't an existing value, the code within the brackets won't be executed.

if let oldValue = scores.updateValue(100, forKey: "Richard") {
    print("Richard's old value was \(oldValue)")
}

// To remove an item from a dictionary, you can use subscript syntax, setting the value to nil.
scores["Richard"] = nil

// Similar to updating a value, dictionaries have a removeValue(forKey:) method if you need the old value returned before removing it:

if let oldValue = scores.removeValue(forKey: "Luke") {
    print("Luke's score was \(oldValue) before he stopped playing")
}

// ACCESSING A DICTIONARY -> Swift dictionaries provide two properties not included in other collection types. You can use keys to return a list of all the keys within a dictionary and values to return a list of all the values. IF YOU WANT TO USE THESE COLLECTIONS SUBSEQUENTLY, you'll need to convert them to arrays:
var newScoreBoard: [String: Int] = ["Richard": 500, "Luke": 400, "Cheryl": 800]
let players = Array(newScoreBoard.keys)
let points = Array(newScoreBoard.values)

// TO LOOK UP A PARTICULAR VALUE WITHIN A DICTIONARY, USE IF-LET SYNTAX. If the key you specify is in the dictionary, the result will be the key's corresponding value. However, if the key isn't in the dictionary, the code within the brackets won't be executed.

if let myScore = newScoreBoard["Luke"] {
    print(myScore)
}

if let henrysScore = scores["Henry"] {
    print(henrysScore) // not executed; "Henry" is not a key in the dictionary
}

