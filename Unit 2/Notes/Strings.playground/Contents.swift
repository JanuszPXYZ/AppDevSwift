import UIKit

var str = "Hello, playground"
//
//var text: String = "Picking Swift back up"
//
//
//for element in text {
//    print(element)
//}
//
//for i in 0...10 {
//    if i % 2 == 0 {
//        print(i)
//    }
//}
// Works as intended ;). Now, let's get off to a good start with Swift once again





// Unit 2: Introduction to UIKit
// 2.1: Strings

let greeting: String = "Hello" // This string is immutable
var otherGreeting: String = "Salutations" // while this one is mutable. We can change it if we want to

// Multi-line strings

let joke: String = """
Q: Why did the chicken cross the road?
A: To get to the other side!
"""
print(joke)

// Escape operator
let newGreeting: String = "It is traditional in programming to print \"Hello, World!\""
print(newGreeting)


var myString: String = ""

// If you need to check if a Swift String is empty, you can use the Boolean property, .isEmpty:
if myString.isEmpty {
    print("The string is empty")
}

// Individual characters are of type Character. But since strings are much more common
// in programming than individual characters, Swift will always infer the type of a
// collection of characters - or even a single character - as of type String, UNLESS
// you specify otherwise with type annotation:
let a = "a"
let b: Character = "b"
print(type(of: b))

// Concatenation and Interpolation - Sometimes we need to combine strings. In that case, the "+" operator comes in handy, as it can add strings too:
let string1: String = "Hello"
let string2: String = ", world!"
let combString: String = string1 + string2
print(combString)

var testString: String = "Hello"
testString += "My Man!"
testString = testString + string1
print(testString)

// String interpolation
let name: String = "Rick"
let age: Int = 30
print("\(name) is \(age) years old")

let num1: Int = 4
let num2: Int = 5
print("If num1 is \(num1) and num2 is \(num2) then num1 + num2 is equal to \(num1 + num2)")

// String equality and comparison - We can check for equality between two "sets" of strings
// by using the == operator. As you might expect, the == checks for identical characters in
// the same order. Since uppercase characters aren't identical to their lowercase counterparts,
// the strings have the same value if the case of each character also matches.
let month: String = "January"
let otherMonth: String = "January"
let lowercaseMonth: String = "january"

if month == otherMonth {
    print("They are the same")
}

if month != lowercaseMonth {
    print("They are not the same")
}

// But maybe we want to ignore capitalization of a string when checking for
// string equality. You can use lowercased() method to normalize the two,
// comparing an all-lowercase version of the string with an all-lowercase version
// of the calling string

let nameCase: String = "Johnny Appleseed"
if nameCase.lowercased() == "joHnnY aPPleseeD".lowercased() {
    print("The two names are equal")
}

// If you want to match the beginning or the end of the string,
// you can use the hasPrefix(_:) or the hasSuffix(_:) method. Just like,
// ==, these matches are case-sensitive
let greetingCase: String = "Hello, world!"
print(greetingCase.hasPrefix("Hello"))
print(greetingCase.hasSuffix("world!"))
print(greetingCase.hasSuffix("World!"))

// Maybe you want to check if one string is somewhere
// within another string. You can use the contains() method
// to return a Boolean value that indicates whether or not
// the substring was found.
let newGreet: String = "Hi Rick, my name is Amy."
if newGreet.contains("my name is") {
    print("Making an introduction")
}

// Since string is a collection of characters, its length is equal to the total number of
// characters. The size of ANY COLLECTION can be determined by using its count property.
let newName: String = "Ryan Mears"
let count: Int = newName.count // It is a property, so no need to use the parentheses

let newPassword: String = "1234"

if newPassword.count < 8 {
    print("The password is too short. Passwords should have at least eight characters")
}

// We can use the switch statements to perform specific blocks of code
// based on a particular case. You can also use the switch statement
// to pattern-match multiple values of strings or characters and to respond
// accordingly

let someChar: Character = "e"

switch someChar {
    case "a", "e", "i", "o", "u":
        print("\(someChar) is a vowel")
    default:
        print("\(someChar) is a consonant")
}
