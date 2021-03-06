import UIKit
import Foundation

// Unit 4: Tables and Persistence - PROTOCOLS

// COMPARING INFORMATION WITH EQUATABLE
// Scenario: Imagine your team is building an employee directory app for your company. You're tasked with building the data model to represent all the employees, their job titles, and their phone numbers.

//struct Employee {
//    var firstName: String
//    var lastName: String
//    var jobTitle: String
//    var phoneNumber: String
//}

struct Company {
    var name: String
    var employees: [Employee]
}

// When building the app. you're asked to build a feature that allows any employee to edit their own information and prevents anyone else from doing so. You'll accomplish this by displaying an Edit button when the user navigates to their own detail screen. But how can you make sure it's the right employee? Each time the current employee navigates to an employee detail screen, you'll need to compare that employee to the employee whose information is displayed.

// Imagine you have access to the current employee with a variable Session.currentEmployee, which returns an Employee instance matching the current user. The view controller in charge of displaying the employee detail screen has an employee property. WHEN THE APP LOADS A NEW EMPLOYEE DETAIL SCREEN, YOU'LL NEED TO CHECK IF Session.currentEmployee AND Employee ARE EQUAL. If so, you'll enable the Edit button. If not, you'll hide the button. This is a good starting point however, the == operator checks if two values are equal to each other. But because Employee is a custom type, you must tell Swift exactly how to compare the two instances for equality. This can be done by adopting the Equatable protocol.

//struct Employee: Equatable {
//        var firstName: String
//        var lastName: String
//        var jobTitle: String
//        var phoneNumber: String
//
//    static func ==(lhs: Employee, rhs: Employee) -> Bool {
//        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.jobTitle == rhs.jobTitle && lhs.phoneNumber == rhs.phoneNumber
//    }
//}

// In certain cases, there are requirements of a protocol that can be autogenerated for you. For example, if you specify that one of your types conforms to the Equatable protocol and don't write your own "==" method, the Swift compiler will autogenerate the implementation we just looked at. In other words, if all your == method is going to do is compare all of the instance properties, you can just not write it and the compiler will take care of it for you.

// SORTING INFORMATION WITH COMPARABLE
// Let's imagine we are tasked with implementing a function to our app that will display a list of all employees, sorted alphabetically by last name.

let employee1 = Employee(firstName: "Ben", lastName: "Atkins", jobTitle: "Front Desk", phoneNumber: "415-555-7767")
let employee2 = Employee(firstName: "Vara", lastName: "Carr", jobTitle: "CEO", phoneNumber: "415-555-7768")
let employee3 = Employee(firstName: "Grant", lastName: "Phelps", jobTitle: "Senior Manager", phoneNumber: "415-555-7769")
let employee4 = Employee(firstName: "Sang", lastName: "Han", jobTitle: "Accountant", phoneNumber: "415-555-7770")
let employee5 = Employee(firstName: "Daren", lastName: "Estrada", jobTitle: "Sales Lead", phoneNumber: "415-555-7771")

let employees = [employee1, employee2, employee3, employee4, employee5]

// Swift provides a protocol, called Comparable, that allows you to define how to sort objects using the <, <=, >, or >= operators. Comparable has two requirements: It requires that the type has adopted the Equatable protocol, and it requires the developer to implement the < operator - which will return a Bool for whether the left-hand value is less than right-hand value.

struct Employee: Equatable, Comparable {
    var firstName: String
    var lastName: String
    var jobTitle: String
    var phoneNumber: String
    
    static func < (lhs: Employee, rhs: Employee) -> Bool {
        return lhs.lastName < rhs.lastName
    }
}

// Now we can use the sorted(by:) function to return the array of employees sorted by last name

//let sortedEmployees = employees.sorted(by: <)
//
//for employee in sortedEmployees {
//    print(employee)
//}

// What is even cooler, is that while sorting the values, you can provide other operators as well! So it is not a problem to pass, say, ">" instead of "<", even though our protocol method says otherwise.

//let descendingEmployees = employees.sorted(by: >)
//
//for employee in descendingEmployees {
//    print(employee)
//}


// ENCODING AND DECODING OBJECTS WITH CODABLE
// Many apps save user input so that the data still exists the next time the user opens the app. To save user data, the values that live in a memory must be encoded to a form of data that can be written to a file. The Codable protocol makes this simple by creating key/value pairs from your object's property names and values that can then be used by an Encoder or Decoder object.

// Most Swift types that you use from the standard library already conform to Codable. If all of your custom type's properties conform to Codable then all you have to do is add Codable to the type declaration and the Swift compiler will autogenerate the necessary implementation.

struct EmployeeCodable: Equatable, Comparable, Codable {
    var firstName: String
    var lastName: String
    var jobTitle: String
    var phoneNumber: String
    
    static func < (lhs: EmployeeCodable, rhs: EmployeeCodable) -> Bool {
        return lhs.lastName < rhs.lastName
    }
}

// This lets an Encoder or Decoder object know that your type has all of the information it needs to be able to encode or decode your object to or from a certain data format.

// The encode(_:) method on JSONEncoder is considered a THROWING function, a special type of Swift function that can return specific types of errors. We'll see the try? syntax in the following sample code which allows the function to return an optional value. If there's no error, the optional will hold the expected value; if there's an error, the optional will be nil.

let ben = EmployeeCodable(firstName: "Ben", lastName: "Atkins", jobTitle: "Front Desk", phoneNumber: "415-555-7767")
let jsonEncoder = JSONEncoder()

if let jsonData = try? jsonEncoder.encode(ben),
    let jsonString = String(data: jsonData, encoding: .utf8) {
    print(jsonString)
}

// CREATING A PROTOCOL
// To define your own protocol, use the protocol keyword followed by the name you want to use, and then define the requirements in a set of curly braces.
// HOWEVER, when requiring a property, you must define whether the property is READ-ONLY or READ/WRITE. Read-only means you can GET the variable, but you can't set it. Read/write means you can both get and set the value. If a property is read-only, you can implement it using a computed property. If it's read/write, it should be a regular property. The following code defines a FullyNamed protocol that requires a fullName property and a sayFullName() method.

protocol FullyNamed {
    var fullName: String { get }
    
    func sayFullName()
}
// Now we can adopt the protocol to a given type

struct Person: FullyNamed {
    var firstName: String
    var lastName: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    func sayFullName() {
        print(fullName)
    }
}

