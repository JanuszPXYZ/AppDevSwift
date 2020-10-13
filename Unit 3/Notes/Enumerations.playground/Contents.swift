import UIKit

// ENUMERATIONS (or enums for short)
// As a programmer you'll work with many situations that require you to assign values from a limited number of options. Imagine you're writing a program that allows passengers to select a seat from three options: window, middle, and aisle. In Swift, you'd do this with an enumeration.

// enums are simply A NAMED SET OF OPTIONS

enum CompassPoint {
    case north
    case east
    case south
    case west
}

// Once an enum has been defined, we can start using it like any other type in Swift.

var compassHeading = CompassPoint.west
print(type(of: compassHeading))

// Alternatively, you can assign enums like this:
var anotherHeading: CompassPoint = .west

// Now that the type of the anotherHeading is changed, you can change the value to another compass point using the shorter dot notation:
anotherHeading = .north

// CONTROL FLOW WITH ENUMS
// In the control flow lesson, you learned how to use if statements and switch statements to respond to Bool values. You can use the same control flow logic when working with different cases of an enumeration. Consider the example below:

switch anotherHeading {
    case .north:
        print("I am heading north.")
    case .east:
        print("I am heading east.")
    case .south:
        print("I am heading south.")
    case .west:
        print("I am heading west.")
}

// TYPE SAFETY BENEFITS - Enumerations are especially important in Swift because they allow you to represent information, such as strings or numbers, in a type-safe way. Imagine a set of data that represents movies of specific genres. Before learning about enums, you'd probably define a Movie struct that would hold all of the information, where each property has its type defined, say genre: String. This however, is error-prone. Imagine you'd deploy a struct like this in your app to collect data about movies. Someone might input a genre such as "Aminated" instead of "Animated", and a movie might be missing from a particular category. Instead we could define an enumeration called Genre that would contain all the available options, like so:

enum Genre {
    case animated, action, romance, documentary, biography, thriller
}

struct Movie {
    var name: String
    var releaseYear: Int
    var genre: Genre
}

// After that you simply select an option from the limited set defined above the struct

let movie = Movie(name: "Finding Dory", releaseYear: 2016, genre: .animated)
