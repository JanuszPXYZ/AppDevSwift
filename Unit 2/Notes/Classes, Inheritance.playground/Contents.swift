import UIKit

// Lesson 2.4 - CLASSES, INHERITANCE
// In a previous lesson we went over Structures as a way to compile data and functionality into a type. Many programming languages also support another feature, called classes, that perform similar functionality. IN SPECIAL CASES, CLASSES CAN (AND SHOULD) BE USED INSTEAD OF STRUCTURES.


class Person {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    // We can add functionality to a class by adding functions to the class definition
    
    func sayHello() {
        print("Hello, there!")
    }
}

let person = Person(name: "Jasmine")
print(person.name)
person.sayHello()

// We've seen an almost-identical example in the previous lesson on structures. BUT HOW DO CLASSES DIFFER FROM STRUCTURES?
// #1) INHERITANCE

class Vehicle {
    var currentSpeed: Double = 0.0
    
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

// Subclassing

class Bicycle: Vehicle {
    var hasBasket: Bool = false
    
//    init(hasBasket: Bool = false) {
//        self.hasBasket = hasBasket
//    }
}
// I added the custom initializer to the Bicycle class, because there are two ways of setting the boolean value for this subclass. One, after we initialize the class, and we simply access the .hasBasket property and set it to true. Or the second method of creating a custom initializer for the subclass (so essentially what I did).

let bicycle = Bicycle()
bicycle.hasBasket
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

// Subclasses can themselves be subclassed
class Tandem: Bicycle {
    var currentNumberOfPassengers: Int = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")

// OVERRIDE METHODS AND PROPERTIES

class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo!")
    }
}

let train = Train()
train.makeNoise()

class Car: Vehicle {
    var gear: Int = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

// OVERRIDE INITIALIZER

class Student: Person {
    var favoriteSubject: String
    
    init(name: String, favoriteSubject: String) {
        self.favoriteSubject = favoriteSubject
        super.init(name: name)
    }
}


// REFERENCES

class PersonRef {
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

var jack = PersonRef(name: "Jack", age: 24)
var myFriend = jack
jack.age += 1

print(jack.age)
print(myFriend.age)
