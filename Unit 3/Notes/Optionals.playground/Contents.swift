import UIKit

// UNIT 3: OPTIONALS

//struct Book {
//    var name: String
//    var publicationYear: Int
//}
//
//let firstHarryPotter = Book(name: "Harry Potter and the Sorcerer's Stone", publicationYear: 1997)
//let secondHarryPotter = Book(name: "Harry Potter and the Chamber of Secrets", publicationYear: 1998)
//let thirdHarryPotter = Book(name: "Harry Potter and the Prisoner of Azkaban", publicationYear: 1999)
//
//let books = [firstHarryPotter, secondHarryPotter, thirdHarryPotter]

// This is of course a fine example of defining a Book struct that represents some data, but what if we have to add a book to the bookstore that was announced but with no known pubblicationYear? That certainly complicates things, because our Book struct requires us to input data upon initialization. Using nil wouldn't cut it either, because nil is the absence of value. There is a workaround to this problem however, and this is through the use of optionals. By redefining one of the attributes, we can accommodate for the lack of publicationYear information.

struct Book {
    var name: String
    var publicationYear: Int?
}

let newBook = Book(name: "Rebels and Lions", publicationYear: nil)

// Perfect. This solves our problem of no known publicationYear for "Rebels and Lions"

// SPECIFYING THE TYPE OF AN OPTIONAL
// Note: You can't create an optional WITHOUT SPECIFYING THE TYPE. In the example below, type inference will assume your variable is non-optional

var serverResponseCode = 404 // 'Int', not 'Int?'

// In the next example, type inference does not have any information to determine the data's type IF THE DATA ISN'T NIL, i.e. if the variable's value might change in the future from the initial "absence" of value.

// var serverResponseCode2 = nil // Error, no type specified when not 'nil' -> Throws an error "nil requires a contextual type"

// For these reasons, in most cases you'll need to use type annotation to specify the type when creating an optional variable or constant. Take a look at the examples below:

var anotherServerResponseCode: Int? = 404 // Set to 404, but could be nil later
var yetAnotherServerResponseCode: Int? = nil // Set to nil, but could hold an 'Int' later


// OPTIONAL BINDING

if newBook.publicationYear != nil {
    newBook.publicationYear!
} else {
    print("There is no known publication date for this book")
}


let string = "123"
//let possibleNumber = Int(string)

if let possibleNumber = Int(string) {
    print(possibleNumber)
}

// FAILABLE INITIALIZERS -> i.e. any initializer that might return nil (init?)
struct Toddler {
    var name: String
    var monthsOld: Int
    
    init?(name: String, monthsOld: Int) {
        if monthsOld < 12 || monthsOld > 36 {
            return nil
        } else {
            self.name = name
            self.monthsOld = monthsOld
        }
    }
}

let possibleToddler = Toddler(name: "John", monthsOld: 14)

if let toddler = possibleToddler {
    print("\(toddler.name) is \(toddler.monthsOld) months old")
} else {
    print("The age you specified for the toddler is not between 1 and 3 years of age")
}

// OPTIONAL CHAINING

struct Person {
    var age: Int
    var residence: Residence?
}

struct Residence {
    var address: Address?
}

struct Address {
    var buildingNumber: String
    var streetName: String
    var apartmentNumber: String?
}

let address = Address(buildingNumber: "25", streetName: "Palo Alto", apartmentNumber: "5")
let residence = Residence(address: address)
let personOne = Person(age: 26, residence: residence)

if let theResidence = personOne.residence {
    if let theAddress = theResidence.address {
        if let theApartmentNumber = theAddress.apartmentNumber {
            print("he/she lives in apartment number \(theApartmentNumber)")
        }
    }
}
// Instead of nesting if-lets we can chain these structs together, and we end up with something like this:

if let theApartmentNumber = personOne.residence?.address?.apartmentNumber {
    print("He/She lives in apartment number \(theApartmentNumber)")
}
