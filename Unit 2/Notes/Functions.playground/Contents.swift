import UIKit
// 2.2 FUNCTIONS
// Defining a function
// func functionName(parameters) -> ReturnType {body of the function}

// Here's an example of a function that will display the first 10 digits of pi. And
// since printing pi doesn't need to return anything relevant to the function caller,
// no return value is specified
func displayPi() {
    print("3.1415926535")
}

// We can now call the function
displayPi()

// FUNCTION PARAMETERS
func triple(value: Int) {
    let result = value * 3
    print("If you multiply \(value) by 3, you'll get \(result)")
}

triple(value: 10)

func multiply(_ firstNumber: Int, _ secondNumber: Int) {
    let result = firstNumber * secondNumber
    print("\(firstNumber) times \(secondNumber) is equal to \(result)")
}

multiply(10, 5)

func sayHello(firstName: String) {
    print("Hello, \(firstName)")
}

sayHello(firstName: "Aidyn")

func sayHelloR(to: String, and: String) {
    print("Hello \(to) and \(and)")
}
// You can probably see that, within the body of the function, to and and are very poor names.
// If you want the name of the constant within the function to differ from the argument label, you can
// specify an external name before the local name:

func betterHello(to person: String, and anotherPerson: String) {
    print("Hello \(person) and \(anotherPerson)")
}

betterHello(to: "Miles", and: "Riley")

// DEFAULT PARAMETER VALUES - must all have argument labels
func display(teamName: String, score: Int = 0) {
    print("\(teamName): \(score)")
}

display(teamName: "Wombats", score: 100)
display(teamName: "Wombats")

// RETURN VALUES
func multiplyReturn(firstNumber: Int, secondNumber: Int) -> Int {
    let result = firstNumber * secondNumber
    return result
}
// Multiplying two Ints will always result in an Int, so that's the return type
// you'll use (->). The function above could also be written without storing the result
// constant and then returning it. You could simply write return firstNumber * secondNumber.
let myResult: Int = multiplyReturn(firstNumber: 10, secondNumber: 5)
print("10 * 5 is \(myResult)")

// Yes, we can put functions in the string interpolation method. So storing the result
// of the multiplication in a constant here is unnecessary.

