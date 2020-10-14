/*:
 ## Exercise - Methods
 
 A `Book` struct has been created for you below. Add an instance method on `Book` called `description` that will print out facts about the book. Then create an instance of `Book` and call this method on that instance.
 */
struct Book {
    var title: String
    var author: String
    var pages: Int
    var price: Double
    
    func description() -> String {
        return "The title of the book is \(title), written by \(author). It has \(pages) and costs \(price)"
    }
}

let favoriteBook = Book(title: "Magic Mountain", author: "Thomas Mann", pages: 890, price: 24.99)
print(favoriteBook.description())
/*:
 A `Post` struct has been created for you below, representing a generic social media post. Add a mutating method on `Post` called `like` that will increment `likes` by one. Then create an instance of `Post` and call `like()` on it. Print out the `likes` property before and after calling the method to see whether or not the value was incremented.
 */
struct Post {
    var message: String
    var likes: Int
    var numberOfComments: Int
    
    mutating func like() {
        likes += 1
    }
}

var newPost = Post(message: "Eating burgers at KFC", likes: 100, numberOfComments: 10)
print(newPost.likes)
newPost.like()
print(newPost.likes)
//: [Previous](@previous)  |  page 5 of 10  |  [Next: App Exercise - Workout Functions](@next)
