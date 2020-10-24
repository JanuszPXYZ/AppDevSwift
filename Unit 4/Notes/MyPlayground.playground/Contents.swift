//import UIKit
//
//// Looking for ways to implement sections in EmojiDictionary
//
//var arrayOfArrays: [[String]] = [["Value", "Key", "Apple", "Swift", "Programming"]]
//
//for element in arrayOfArrays {
//    for innerElement in element {
//        print(innerElement)
//    }
//}
//
//
//struct Emoji {
//    var symbol: String
//    var name: String
//    var description: String
//    var usage: String
//
//    init(symbol: String, name: String, description: String, usage: String) {
//        self.symbol = symbol
//        self.name = name
//        self.description = description
//        self.usage = usage
//    }
//}
//
//var emojis: [[Emoji]] = [
//    [Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
//    Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
//    Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
//    Emoji(symbol: "🤯", name: "Exploding Head", description: "An exploding head.", usage: "something extraordinary; mindblowing"),
//    Emoji(symbol: "👮‍♀️", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority")],
//    [Emoji(symbol: "🐢", name: "Turtle", description: "A cute, little turtle.", usage: "Something slow"),
//    Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
//    Emoji(symbol: "🦊", name: "Fox", description: "A cute little fox", usage: "mischievous, cunning")],
//    [Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti", usage: "spaghetti")],
//    [Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
//    Emoji(symbol: "🎸", name: "Guitar", description: "An electric guitar", usage: "rock concert; good music"),
//    Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying")],
//    [Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
//    Emoji(symbol: "🏄🏿‍♂️", name: "Surfer", description: "Ridin' the wave", usage: "something good; flowing, being on a roll"),
//    Emoji(symbol: "⚽️", name: "Football", description: "A ball to play soccer", usage: "Game"),
//    Emoji(symbol: "🎮", name: "Game controller", description: "A controller used in gaming", usage: "Game")],
//    [Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
//    Emoji(symbol: "👊", name: "Fist Bump", description: "A clenched fist", usage: "Greeting, or occassional wpierdol"),
//    Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
//    Emoji(symbol: "🎰", name: "Single arm bandit", description: "A single arm bandit used in casinos", usage: "Gamble")],
//    [Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion")],
//]
//
//for element in emojis {
//    print(element.count)
//}
struct Food {
    var name: String
    var description: String
}

struct Meal {
    var name: String
    var food: [Food]
}

var meals: [Meal] {
    let breakfast = Meal(name: "Breakfast", food: [Food(name: "Sandwich with avocado", description: "Tasty sandwich with fresh avocado."), Food(name: "Scrambled eggs with orange juice", description: "Tasty scrambled eggs and a natural, fresh orange juice")])
    let lunch = Meal(name: "Lunch", food: [Food(name: "Sushi tuna rolls", description: "Exquisite sushi rolls with fresh tuna."),
    Food(name: "Vegan Steak with french fries", description: "A vegan steak made from seitan with french fries.")])
    let dinner = Meal(name: "Dinner", food: [Food(name: "Spanish Tapas with red wine", description: "Small sandwiches served with regional Spanish wine"), Food(name: "Pasta with pesto", description: "Italian pasta with pesto.")])
    
    return [breakfast, lunch, dinner]
}

meals[0].food.count
