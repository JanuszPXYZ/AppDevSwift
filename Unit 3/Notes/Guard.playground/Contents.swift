import UIKit

// LESSON 3.3: GUARD

// The "pyramid of doom"
let birthdayIsToday: Bool = true
let invitedGuests: [String] = ["Charles", "Kate", "Kay", "Maria"]
var cakeCandlesLit: Bool = false

func singHappyBirthday() {
    if birthdayIsToday {
        if !invitedGuests.isEmpty {
            if cakeCandlesLit {
                print("Happy Birthday to You!")
            } else {
                print("The cake's candles haven't been lit.")
            }
        } else {
            print("It's just a family party.")
        }
    } else {
        print("No one has birthday today")
    }
}

// This code is getting harder to read by each line. Why? Because each else statement moves farther and farther from its corresponding if statement, so it's tough to tell how they match up. It is very easy to make a mistake in a code that is nested like this.

// Rather than bury "successful" code (code that executes when all condtions are true), you can use guard statement to move that code out of any braces. Check it out:

func guardHappyBday() {
    guard birthdayIsToday else {
        print("No one has a birthday today")
        return
    }
    
    guard !invitedGuests.isEmpty else {
        print("It's just a family party.")
        return
    }
    
    guard cakeCandlesLit else {
        print("The cake's candles haven't been lit.")
        return
    }
    
    print("Happy Birthday to you!")
}

// In fact, the example above is the opposite of an if statement. If the condition evaluates to false, the else portion is executed.

// ! A guard statement requires you to exit the scope of the function by using the return keyword in the else case.

// By eliminating all the undesirable conditions within guard statement and calling return, you can move conditional checks to the top of the function and put the code you expect to run at the bottom. Check it out in the two examples below

func classicDivide(_ number: Double, by divisor: Double) {
    if divisor != 0.0 {
        let result = number / divisor
        print(result)
    }
}

func guardDivide(_ number: Double, by divisor: Double) {
    guard divisor != 0.0 else { return }
    let result = number / divisor
    print(result)
}

// The code using guard does an early return if the divisor passed in is 0. By the time it reaches the line that does the actual division, it has already removed any erroneous parameters.

// GUARD WITH OPTIONALS
// Using guard with optionals lets us bind the value within an optional to a constant THAT'S ACCESSIBLE OUTSIDE THE BRACES. The syntax used is guard let. Both "if let" and "guard let" let you unwrap multiple optionals in one statement. However, doing so with a guard let makes all constants available throughout the rest of the function, rather than only within the control flow braces.

func processBook(title: String?, price: Double?, pages: Int?) {
    if let theTitle = title,
        let thePrice = price,
        let thePages = pages {
        print("\(theTitle) costst $\(thePrice) and has \(thePages) pages.")
    }
}

func bookProcessing(title: String?, price: Double?, pages: Int?) {
    guard let theTitle = title,
        let thePrice = price,
        let thePages = pages else { return }
    print("\(theTitle) costst $\(thePrice) and has \(thePages) pages.")
}

func calculateResult(a: Int?, b: Int?, c: Int?) -> Int {
    guard let aValue = a else { return 0 }
    guard let bValue = b else { return aValue }
    guard let cValue = c else { return bValue }
    
    return aValue + bValue + cValue
}

calculateResult(a: 4, b: 8, c: nil)

func breakDown(a: Int?, b: Int?, c: Int?) -> Int {
    guard let aVal = a else {return 0}
    guard let bVal = b else {return aVal}
    guard let cVal = c else {return bVal}
    return aVal + bVal + cVal
}

breakDown(a: 4, b: 8, c: nil)
