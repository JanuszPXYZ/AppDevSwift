import UIKit
import Foundation

// Persistence Practice

struct Note: Codable {
    let title: String
    let text: String
    let timestamp: Date
}

// Creating an instance of Note that can be encoded

let newNote = Note(title: "Grocery Run", text: "Pick up mayonnaise, mustard, lettuce, tomato, and pickles", timestamp: Date())

// Encoding the note to a plist

//let propertyListEncoder = PropertyListEncoder()
//
//if let encodedNote = try? propertyListEncoder.encode(newNote) {
//    print(encodedNote) // Returns 156 bytes
//    let propertyListDecoder = PropertyListDecoder()
//    if let decodedNote = try? propertyListDecoder.decode(Note.self, from: encodedNote) {
//        print(decodedNote)
//    }
//}


// Writing data to a file, reading from a file

// Creating a URL that points to the Documents folder. This code simply "gains" access to my documents folder, the file in question is not saved at this point.
let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")
// Writing the Data

let propertyListEncoder = PropertyListEncoder()
let encodedNote = try? propertyListEncoder.encode(newNote)

try? encodedNote?.write(to: archiveURL, options: .noFileProtection)

// Retrieving the data from the file

let propertyListDecoder = PropertyListDecoder()

if let retrievedNoteData = try? Data(contentsOf: archiveURL),
    let decodedNote = try? propertyListDecoder.decode(Note.self, from: retrievedNoteData) {
    print(decodedNote)
}

// Saving an Array of Model Data

let note1 = Note(title: "Note One", text: "This is a sample note.", timestamp: Date())
let note2 = Note(title: "Note Two", text: "This is another sample note.", timestamp: Date())
let note3 = Note(title: "Note Three", text: "This is yet another sample note.", timestamp: Date())

let notes = [note1, note2, note3]

let newDocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL2 = newDocumentsDirectory.appendingPathComponent("notes_array").appendingPathExtension("plist")

let anotherPropertyEncoder = PropertyListEncoder()
let encodedNotes = try? anotherPropertyEncoder.encode(notes)

try? encodedNotes?.write(to: archiveURL2, options: .noFileProtection)

let anotherPropertyListDecoder = PropertyListDecoder()

if let retrievedArrayOfNotes = try? Data(contentsOf: archiveURL2),
    let decodedNotes = try? anotherPropertyListDecoder.decode(Array<Note>.self, from: retrievedArrayOfNotes) {
    print(decodedNotes)
}


