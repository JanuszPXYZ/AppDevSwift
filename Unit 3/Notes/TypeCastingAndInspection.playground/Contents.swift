import UIKit

// TYPE CASTING AND INSPECTION

// #1) TYPE CASTING -> Example of Brad taking care of client's pets

class Animal {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Dog: Animal {
    var age: Int?
    init(name: String, age: Int? = nil) {
        self.age = age
        super.init(name: name)
    }
}

class Cat: Animal {
    var boxSize: Int
    init(name: String, boxSize: Int) {
        self.boxSize = boxSize
        super.init(name: name)
    }
}

class Bird: Animal {
    var featherColor: String
    init(name: String, featherColor: String) {
        self.featherColor = featherColor
        super.init(name: name)
    }
}


func walk(dog: Dog) {
    print("Walking \(dog.name)")
}

let doggie = Dog(name: "Mr.Bubbles")
//walk(dog: doggie)

func cleanLitterBox(cat: Cat) {
    print("Cleaning the \(cat.boxSize) litter box.")
}

let catsie = Cat(name: "Mr. Peanut", boxSize: 25)
//cleanLitterBox(cat: catsie)


func cleanCage(bird: Bird) {
    print("Removing the \(bird.featherColor) feathers at the bottom of the cage")
}

let birdsie = Bird(name: "Mr. Rainbow", featherColor: "Blue")
//cleanCage(bird: birdsie)

func allClientAnimals() -> [Animal] {
    let listOfPets = [doggie, catsie, birdsie]
    return listOfPets
}

let pets = allClientAnimals()

for pet in pets {
    if let dog = pet as? Dog {
        walk(dog: dog)
    } else if let cat = pet as? Cat {
        cleanLitterBox(cat: cat)
    } else if let bird = pet as? Bird {
        cleanCage(bird: bird)
    }
}
