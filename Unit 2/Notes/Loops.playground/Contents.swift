import UIKit

// Lesson 2.6: LOOPS

// F O R  L O O P S -> The first loop that you'll learn in Swift is the for loop, also known more specifically as for-in loop. A for loop is useful for repeating something a set number of times or for performing work across a collection of values. A for-in loop executes a set of statements for each item within a range, sequence, or collection. Suppose you have a range of numbers between 1 and 5, and you want to print each value within the range. Rather than writing out five separate print statements, you can use a for-in loop over the range and write one print statement. Like so:

for index in 1...5 {
    print("This is number \(index)")
}
// In the code above, index is a constant that's available to customize the work performed within the braces (the for-in loop). The first time the statement within the braces is executed, index has a value of 1, the first value in the range. When execution is complete, the value of index is updated to 2, the next value in the range. So on, and so on, until the entire range is exhausted, and the code can move on to statements after the loop.

// But let's say that your result doesn't need to use the values in the range. If you just need a way to perform a series of steps a certain number of times, you can skip assigning a value to a constant and replace its name with a "_":
for _ in 1...3 {
    print("Hello!")
}

// You can use the same for-in syntax to iterate over each item in an array:
let names = ["Joseph", "Cathy", "Winston"]

for name in names {
    print("Hello \(name)")
}

// Since String IS A COLLECTION TYPE, it has a similar functionality to an array. You can use a for-in loop to iterate over each character in a String.

for letter in "ABCD" {
    print("The letter is \(letter)")
}

// What if you need the index of each element in addition to its value? You can use the enumerated() method of an array or string to return a tuple containing both the index and the value of each item.

for (index, letter) in "ABCD".enumerated() {
    print("\(index): \(letter)")
}

// If you use a for-in loop with a dictionary, the loop generates a tuple - a special type that can hold an ordered list of values wrapped in parentheses - that holds the key and value of each entry. Since a dictionary is usually accessed by specifying a key, the loop doesn't guarantee any particular order of the items as it works through the dictionary:

let vehicles: [String: Int] = ["unicycle": 1, "bicycle": 2, "tricycle": 3, "quad bike": 4]

for (vehicleName, wheelCount) in vehicles {
    print("A \(vehicleName) has \(wheelCount) wheel(s)")
}

// W H I L E  L O O P S -> A while loop will continue to loop until its specified condition is NO LONGER TRUE. Imagine you want to keep playing a game until you run out of "lives." The condition under which you continue looping is that the number of lives is greater than 0:

var numberOfLives = 3

while numberOfLives > 0 {
    print("Number of lives remaining: \(numberOfLives)")
    numberOfLives -= 1
}

// Swift checks the condition before each loop is executed, which means it's possible to skip the loop entirely if the condition is never satisfied. If numberOfLives had been initialized to 0 in the above example, the while loop would determine that 0 > 0 is false and would never proceed to the body of the loop. For this reason, the body of the while loop should perform work that will eventually change the condition.

// The body of the while loop should execute statements that will, at some point, result in false condition:
var noLives = 3
var stillAlive = true
while stillAlive {
    noLives -= 1
    if noLives == 0 {
        stillAlive = false
    }
}

// CONTROL TRANSFER STATEMENTS -> There may be situations when you want to stop execution of a loop from within the loop's body. The Swift keyword "break" will break the code execution within the loop and start executing any code defined after the loop. In the code below, the loop breaks if the counter reaches 0:

for counter in -3...3 {
    print(counter)
    if counter == 0 {
        break
    }
}

// There may also be situations in which you want to skip to the next iteration in a loop. While the break keyword will end the loop entirely, continue will move onto the next iteration. For example, you may have an array where each element is of type Person, and you want to loop through the array and send an email to everyone 18 years of age and older:

struct Person {
    var name: String
    var age: Int
}

let p1 = Person(name: "Jack", age: 24)
let p2 = Person(name: "Cathy", age: 17)
let p3 = Person(name: "Mark", age: 32)
let p4 = Person(name: "Christie", age: 16)
var people: [Person] = [p1, p2, p3, p4]

for person in people {
    if person.age < 18 {
        continue
    } else {
        print("Welcome to our mailing list, \(person.name)")
    }
}




