import UIKit

// FUNCTIONS

// 1) Self-contained chunks of code that perform a specific task
// 2) Parameters can provide default values to simplify function calls and can be passed as in-out parameters, which modify a passed variable once the function has completed its execution
// 3) Every function in Swift has a type, consisting of function's parameter types and return type. You can use this type like any other type in Swift, which makes it easy to pass functions as parameters to other functions, and to return functions from functions.
// 4) Functions can also be written within other functions to encapsulate useful functionality within a NESTED FUNCTION SCOPE.

// Okay, here's an important distinction that I couldn't grasp when first reading Swift programming tutorials. The distinction is between a PARAMETER of a function and a ARGUMENT of a function. You could argue of course that these are the exactly the same names used to describe the same entity that is being passed to the function, but I think that the Swift documentation described it best: "When you define a function, you can optionally define one or more named, typed values that the function takes as input, known as P A R A M E T E R S. [...] To use a function, you call that function with its name and pass it input values (known as ARGUMENTS).


func greet(person: String) -> String {
    let greeting = "Hello, \(person)!"
    return greeting
}


print(greet(person: "Janusz"))
print(greet(person: "Anna"))
print(greet(person: "John"))


func greetAgain(person: String) -> String {
    return "Hello again, \(person)"
}


// FUNCTIONS WITHOUT PARAMETERS
// Functions are not required to define input parameters. Here's a function with no input parameters, which always returns the same String message whenever it is called.

func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())


// FUNCTIONS WITH MULTIPLE INPUT PARAMETERS

func newGreeting(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

print(newGreeting(person: "John", alreadyGreeted: true))

// FUNCTIONS WITHOUT RETURN VALUES -> Functions are not required to define a return type. Strictly speaking, a function that "does not return a value", still returns a value of some type. Functions without a defined return type return a special value of type Void. This is simply an empty tuple, which is written as ()

// The return value of a function can be ignored when it is called:
func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
// Okay this example was pretty tricky when I first assessed it (i.e. why the fuck the use of the second function skip the return of the first function when it effectively calls the first function?) , but here's how it goes. Even though when we are calling the function printWithoutCounting, the first function is being effectively called, the fact that the second function IS VOID (no return type) means that it cannot return the string.count encapsulated in the first function. Voila.


printAndCount(string: "hello, world")
printWithoutCounting(string: "hello, world")

// Return values can be ignored, but A FUNCTION THAT SAYS IT WILL RETURN A VALUE MUST ALWAYS DO SO. A function with a defined return type cannot allow control to fall out of the bottom of the function without returning a value, and attempting to do so will result in a compile-time error.


// FUNCTIONS WITH MULTIPLE RETURN VALUES - You can use a tuple type as the return type for a function to return multiple values as part of one compound return value.

func minMaxOne(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

var sampleArray: [Int] = [12,5,116,1215]

minMaxOne(array: sampleArray)

// OPTIONAL TUPLE RETURN TYPES - if the tuple type to be returned from a function has the potential to have "no value" for the entire tuple, you can use an optional tuple return type to reflect the fact that the entire tuple can be nil. You write an optional tuple return type by placing a question mark after the tuple type's closing parenthesis, such as (Int, Int)?. Our minMax array function above returns a tuple containing two Int values. However, the function does not perform any safety checks on the array it is passed. Let's fix that.

func minMax(array: [Int]) -> (min: Int, max: Int)? {
    guard !array.isEmpty else { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

var anotherArray: [Int] = []

minMax(array: anotherArray)

// FUNCTION ARGUMENT LABELS AND PARAMETER NAMES -> Each function has both an argument label and a parameter name. The argument label is used when CALLING THE FUNCTION; each argument is written in the function call with its argument label before it. The parameter name is used in the implementation of the function. By default, parameters use their parameter name as their argument label.

// Specifying Argument Labels -> You write an argument label before the parameter name, separated by a space

func someFunction(argumentLabel parameterName: Int) -> Int {
    return (parameterName + parameterName) - 2
}

func greetHometown(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)"
}

print(greetHometown(person: "Josh", from: "Colorado"))


// VARIADIC PARAMETERS
// A variadic parameter accepts zero or more values of a specified type. You use a variadic parameter to specify that the parameter can be passed a varying number of input values when the function is called. Write variadic parameters by inserting three period characters (...) after the parameter's type name.

// The values passed to a variadic parameter are made available within the function's body as an ARRAY of the appropriate type. For example, a variadic parameter with a name of numbers and a type of Double... is made available within the function's body as a constant array called numbers of type [Double]. Check this example of calculating the arithmetic mean for a list of numbers of any length

func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(1,2,3,4,5)
arithmeticMean(3, 8.25, 18.75)

// NOTE: A function may have at most one variadic parameter

// I n - O u t  P a r a m e t e r s
// Function parameters are constants by default. Trying to change the value of a function parameter FROM WITHIN THE BODY OF THAT FUNCTION will result in a compile-time error. This means that you can't change the value of a parameter by mistake. However, if you want a function to modify a parameter's value, and you want those changes to persist after the function call has ended, define that parameter as an IN-OUT PARAMETER instead. You write an in-out parameter by placing the inout keyword right before a parameter's type. An in-out parameter has a value that is passed in to the function, is modified by the function, and is passed back out of the function to replace the original value.

// You can only pass a variable as the argument for an in-out parameter. [...] You place an ampersand directly before a variable's name when you pass it as an argument to an in-out parameter, to indicate that it can be modified by the function. Here's an example of such function

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107

swapTwoInts(&someInt, &anotherInt)


// U S I N G  F U N C T I O N  T Y P E S

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts

// The mathFunction can be read as: "Define a variable called mathFunction, which has a type of a function that takes two Int values, and returns an Int value. Set this new variable to refer to the function called addTwoInts."

// The addTwoInts function has the same type as the mathFunction variable, and so this assignment is allowed by Swift's type checker. We can now call the assigned function with the name mathFunction

print("Result: \(mathFunction(2,3))")

// F U N C T I O N  T Y P E S  A S  P A R A M E T E R  T Y P E S
// You can use a function type such as (Int, Int) -> Int as a parameter type for another function. This enables you to leave some aspects of a function's implementation for the function's caller to provide when the function is called. Here's an example of such function

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 3, 5)

// F U N C T I O N  T Y P E S  A S  R E T U R N  T Y P E S
// You can use a function type as the return type of another function. You do this by writing a complete function type immediately after the return arrow (->) of the returning function. Here's an example

// 1) Define two proprietary functions

func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

// Here's a function called chooseStepFunction(backward:), whose return type is (Int) -> Int. The chooseStepFunction(backward:) function returns the stepForward() function or the stepBackward() function based on a Boolean parameter called backward:

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

// We can now use chooseStepFunction to obtain a function that will step in one direction or the other:

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
currentValue

// The example above determines whether a positive or negative step is needed to move a variable called currentValue progressively closer to zero. currentValue has an initial value of 3, which means that currentValue > 0 returns true, causing chooseStepFunction(backward:) to return to stepBackward(_:) function. A reference to the returned function is stored in a constant called moveNearerToZero.

// Now that moveNearerToZero refers to the correct function, it can be used to count to zero:

print("Counting to zero:")
while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")


// N E S T E D  F U N C T I O N S
// All of the functions that we went over above are examples of global functions, which are defined at a GLOBAL SCOPE. You can also define functions inside the bodies of other functions, known as nested functions.

// Nested functions are hidden from the outside world by default, but can still be called and used by their enclosing function. An enclosing function can also return one if its nested functions to allow the nested function to be used in another scope. We can rewrite the chooseStepFunction example above to use and return nested functions.

func chooseStepFuncRewrite(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1}
    func stepBackward(input: Int) -> Int { return input - 1}
    return backward ? stepBackward : stepForward
}

var anotherVal = -4
let moveNearerToZeroOne = chooseStepFuncRewrite(backward: anotherVal > 0)

while anotherVal != 0 {
    print("\(anotherVal)...")
    anotherVal = moveNearerToZeroOne(anotherVal)
}
print("zero!")


// C L O S U R E S
