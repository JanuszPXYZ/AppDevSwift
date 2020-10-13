import UIKit

// LESSON 2.3: Structures (or structs for short)
// Swift comes with many useful types for representing data like numbers, text, collections,
// and true or false values. But as you get into building apps, you'll find you want to create your own data types, with properties and functions of your own design
// You can create a custom data type by declaring a structure. A structure combines one or more variables into a single type. You can define functionality by adding type and instance methods to a structure.

// In its simplest form, a structure is a named group of one or more properties that make up a type. Properties represent the information about an instance of the structure.

//struct Person {
//    var name: String
//}

// The above declaration simply defines the properties of a Person type. It DOES NOT HAVE A VALUE IN ITSELF. For that, you have to create an instance of the Person type. Then you can access the data stored in its properties, such as the person's name, using dot syntax:

//let firstPerson = Person(name: "Jason")
//print(firstPerson.name)

// You can add functionality to a structure by adding a method. A method is a function that's assigned to
// a specific type. In this example, our Person instances can now sayHello:

struct Person {
    var name: String
    func sayHello() {
        print("Hello, there! My name is \(name)")
    }
}

let person = Person(name: "Jasmine")
person.sayHello()

struct Car {
    var make: String
    var model: String
    var year: Int
    var topSpeed: Int
    
    func startEngine() {
        print("The \(year) \(make) \(model)'s engine has started")
    }
    
    func drive() {
        print("The \(year) \(make) \(model) is moving")
    }
    
    func park() {
        print("The \(year) \(make) \(model) is parked.")
    }
}

let firstCar = Car(make: "Honda", model: "Civic", year: 2010, topSpeed: 120)
firstCar.startEngine()
firstCar.drive()

let secondCar = Car(make: "Ford", model: "Fusion", year: 2013, topSpeed: 125)

// INITIALIZERS
// All Swift types come with an initializer, which is similar to a function that returns a new instance of the type. The default
// initializer is init()

// Instances created from the default initializer have a default value. The default String is "", the default Int is 0, and the
// default Bool is false:
var string = String.init()
var integer = Int.init()
var bool = Bool.init()

// But there is a shorthand version of the default initializer that's much more common. The following snippet is more concise, but works the same as the example above
var string2 = String()
var integer2 = Int()
var bool2 = Bool()

// Whenever you define a new type, you must consider how you'll create new instances.

// DEFAULT VALUES
// During initialization of new instances, Swift requires you to set values for all instance properties.
// One approach is to provide default property values in your type definition. Each instance will be initialized with that value.
// This is useful when defining objects that have a consistent default state, such as 0 as a reading on the odometer.
// The examples above utilise this technique, as they provide an initial "value" to work with.

struct Odometer {
    var count: Int = 0
}

let odometer = Odometer()
print(odometer.count)

// MEMBERWISE INITIALIZERS
// Memberwise initializers include all properties of a structure
let odometer2 = Odometer(count: 27000)
print(odometer2.count)

// CUSTOM INITIALIZERS - Implementing custom logic before assigning all of the properties to a structure.
// Custom initializers have the same requirement as default and memberwise initializers:
// All properties must be set to initial values before completing initialization.

// Consider a Temperature struct with a celsius property. If you have access to a temperature in Celsius, you could initialize it using a memberwise initializer

struct TemperatureOne {
    var celsius: Double
}
let temperature = TemperatureOne(celsius: 30.0)

// But if you have access to a temperature in Fahrenheit, you would need to convert that value to Celsius before using the memberwise initializer
let fahrenheitValue = 98.6
let celsiusValue = (fahrenheitValue - 32) / 1.8
let temperature2 = TemperatureOne(celsius: celsiusValue)

// But the memberwise initializer required you to calculate the Celsius value BEFORE initializing a new Temperature object. Instead, you could create a custom initializer that takes a Fahrenheit value as a parameter, performs the calculation, and assigns the value to the celsius property:

struct Temperature {
    var celsius: Double
    
    init(celsius: Double) {
        self.celsius = celsius
    }
    init(fahrenheit: Double) {
        celsius = (fahrenheit - 32) / 1.8
    }
}

let currentTemperature = Temperature(celsius: 18.5)
let boiling = Temperature(fahrenheit: 212.0)
print(currentTemperature.celsius)
print(boiling.celsius)

// It is of course possible to add multiple custom initializers. Below we add a Kelvin initializer

struct Temperature2 {
    var celsius: Double
    
    init(celsius: Double) {
        self.celsius = celsius
    }
    init(fahrenheit: Double) {
        celsius = (fahrenheit - 32) / 1.8
    }
    init(kelvin: Double) {
        celsius = kelvin - 273.15
    }
}

let newCurrTemp = Temperature2(celsius: 18.5)
let newBoiling = Temperature2(fahrenheit: 212.0)
let freezing = Temperature2(kelvin: 273.15)

// Each instance of Temperature is created using a different initializer and a different value, but each ends as a Temperature object with the required celsius property

// INSTANCE METHODS -> Works just like adding a normal function to a class in Python

struct Size {
    var width: Double
    var height: Double
    
    func area() -> Double {
        return width * height
    }
}

let someSize = Size(width: 10.0, height: 5.5)
let area = someSize.area()

// The someSize instance is of the Size type, and width and height are its PROPERTIES. The area() is an instance method that can be called on ALL INSTANCES of the Size type.

// MUTATING METHODS - Occasionally you'll want to update the PROPERTY VALUES of a structure within an instance method. To do so you'll need to add the mutating keyword before the function.
// In the following example, a simple structure stores mileage data about a specific Car object. Here are some things to consider before coding the solution:
// 1) Store the mileage count to be displayed on an odometer
// 2) Increment the mileage count to update the mileage when the car drives
// 3) Potentially reset the mileage count if the car drives beyond the number of miles that can be displayed on the odometer

struct OdometerUpdated {
    var count: Int = 0 // default value of the count property
    
    mutating func increment() {
        count += 1
    }
    
    mutating func increment(by amount: Int) {
        count += amount
    }
    
    mutating func reset() {
        count = 0
    }
}

var odometerUpdated = OdometerUpdated() // odometer.count defaults to 0
odometerUpdated.increment() // odometer.count is incremented by 1
print(odometerUpdated.count)
odometerUpdated.increment(by: 15)
print(odometerUpdated.count)
odometerUpdated.reset()
print(odometerUpdated.count)

// COMPUTED PROPERTIES - Swift has a feature that allows a PROPERTY to perform logic that returns a calculated value. Consider the Temperature example. While the most of the world uses the Celsius scale of measurement for temperature, some places (such as the U.S.) use Fahrenheit, and certain professions use Kelvin. So it might be useful for the Temperature structure to support all three measurement systems. (Would this be similar to the concept of a decorator in Python?)

struct TemperatureComp {
    var celsius: Double
    var fahrenheit: Double
    var kelvin: Double
}

// Imagine that you'd used the memberwise initializer for this structure:
let newTemp = TemperatureComp(celsius: 0, fahrenheit: 32.0, kelvin: 273.15)

// ANY TIME you would write code to initialize the TemperatureComp object, you'd need to calculate each temperature and pass all those values as parameters. An alternative would be to add multiple initializers that handle the calculations.

//struct TemperatureComp {
//    var celsius: Double
//    var fahrenheit: Double
//    var kelvin: Double
//
//    init(celsius: Double) {
//        self.celsius = celsius
//        fahrenheit = celsius * 1.8 + 32
//        kelvin = celsius + 273.15
//    }
//    init(fahrenheit: Double) {
//        self.fahrenheit = fahrenheit
//        celsius = (fahrenheit - 32) / 1.8
//        kelvin = celsius + 273.15
//    }
//    init(kelvin: Double) {
//        self.kelvin = kelvin
//        celsius = kelvin - 273.15
//        fahrenheit = celsius * 1.8 + 32
//    }
//}

// The approach above, using multiple initializers, involves managing a lot of state, or information. Any time the temperature changes, you would be required to UPDATE ALL THREE PROPERTIES. This approach is error-prone, and would be frustraing for any programmer.

// Swift provides a safer approach. With computed properties, you can create properties THAT CAN COMPUTE THEIR VALUE BASED ON OTHER INSTANCE PROPERTIES OR LOGIC.

struct TemperatureComputed {
    var celsius: Double
    
    var fahrenheit: Double {
        return celsius * 1.8 + 32
    }
    var kelvin: Double {
        return celsius + 273.15
    }
}

// To add a computed property, you declare the property AS A VARIABLE (because its value can change). You must also EXPLICITLY DECLARE THE TYPE. Then you use an open curly brace and closing curly brace to define the logic that calculates the value to return. You can access computed properties using dot syntax, just as you would with any other property.

let currentTemp = TemperatureComputed(celsius: 0.0)
print(currentTemp.fahrenheit)
print(currentTemp.kelvin)

// The logic contained in a computed property will be executed each time the property is accessed, so the returned value will always be up to date.

// PROPERTY OBSERVERS - Swift allows you to observe any property and respond to the changes in the property's value. These property observers are called every time a property's value is set, even if the new value is the SAME AS THE PROPERTY'S CURRENT VALUE. There are two observer CLOSURES, or blocks of code, that you can define on any given property: willSet, and didSet. In the following example, a StepCounter has been defined with a totalSteps property. Both the willSet and didSet observers have been defined. Whenever totalSteps is modified, willSet will be called first, and you'll have access to the new value that will be set to the property value in a constant named newValue. After the property's value has been updated, didSet will be called, and you can access the previous property value using oldValue.

struct StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("About to set totalSteps to \(newValue)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

var stepCounter = StepCounter()
stepCounter.totalSteps = 40
stepCounter.totalSteps = 100
stepCounter.totalSteps = 10
stepCounter.totalSteps


// TYPE PROPERTIES AND METHODS - You learned that instance properties are data about the individual instance of a type, and instance methods are functions that can be called on individual instances of a type. Swift also supports adding type properties and methods, which can be accessed or called on the type itself. Use the static keyword to add a property or method to a type.

// Type properties are useful when a property is related to the type, but not a characteristic of an instance itself. The following sample defines a Temperature struct that has a static property called boilingPoint, which is a constant value for all Temperature instances

struct TemperatureBoil {
    static var boilingPoint = 100
}
let boilingPoint = TemperatureBoil.boilingPoint

// Type methods are similar to type properties. USE A TYPE METHOD WHEN THE ACTION IS RELATED TO THE TYPE, BUT NOT SOMETHING THAT A SPECIFIC INSTANCE OF THE TYPE SHOULD PERFORM.

let smallerNumber = Double.minimum(100, -1000)


// SUPER IMPORTANT STUFF HERE - C O P Y I N G
// If you assign a structure to a variable or pass an instance as a parameter into a function, the VALUES ARE COPIED. Separate variables are therefore SEPARATE INSTANCES OF THE VALUE, which means that changing one value doesn't change the other. This is completely different behavior to a Class, which only copies the particular place in the memory.

var someNewSize = Size(width: 250, height: 1000)
var anotherNewSize = someNewSize

someNewSize.width = 500

print(someNewSize.width)
print(anotherNewSize.width)

// Note that the width property of someNewSize changed to have value of 500, but the width property of anotherNewSize did not, because although we set anotherNewSize equal to someSize, this created copy of someNewSize, and the copy's width did not change when the original width was changed.
