import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// Creating an iTunesSearch app
struct StoreItem: Codable {
    var name: String
    var album: String
    var url: URL
    var price: Double
    
    enum CodingKeys: String, CodingKey {
        case name = "artistName"
        case album = "collectionName"
        case url = "artistViewUrl"
        case price = "collectionPrice"
    }
    
    init(from decoder: Decoder) throws {
        let valueDecoder = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try valueDecoder.decode(String.self, forKey: CodingKeys.name)
        self.album = try valueDecoder.decode(String.self, forKey: CodingKeys.album)
        self.url = try valueDecoder.decode(URL.self, forKey: CodingKeys.url)
        self.price = try valueDecoder.decode(Double.self, forKey: CodingKeys.price)
    }
}

struct StoreItems: Codable {
    let results: [StoreItem]
}


//let baseURL = URL(string: "https://itunes.apple.com/search?")!

let favoriteArtist: [String: String] = [
    "term": "john+mayer",
    "media": "music",
    "entity": "album",
    "attribute": "albumTerm"
]

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}



func anotherFetch(completion: @escaping ([StoreItem]?) -> Void) {
    let favoriteArtist: [String: String] = [
        "term": "john+mayer",
        "media": "music",
        "entity": "album",
        "attribute": "albumTerm"
    ]
    let baseURL = URL(string: "https://itunes.apple.com/search?")!
    let url = baseURL.withQueries(favoriteArtist)!
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        let jsonDecoder = JSONDecoder()
        if let data = data,
            let storeItems = try? jsonDecoder.decode(StoreItem.self, from: data) {
            completion([storeItems])
        } else {
            print("Error occurred while extracting the data")
            completion(nil)
            return
        }
    }
    task.resume()
}

anotherFetch { (fetchedItem) in
    print(fetchedItem)
}






















func fetchItems(matching query: [String: String], completion: @escaping ([StoreItem]?) -> Void) {
    let baseURL = URL(string: "https://itunes.apple.com/search?")!
    guard let url = baseURL.withQueries(query) else {
        print("Unable to build URL with supplied queries.")
        return
    }
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        let jsonDecoder = JSONDecoder()
        if let data = data,
            let storeItems = try? jsonDecoder.decode(StoreItems.self, from: data) {
            completion(storeItems.results)
        } else {
            print("Either no data was returned, or data was not properly decoded")
            completion(nil)
            return
        }
        PlaygroundPage.current.finishExecution()
    }
    task.resume()
}

fetchItems(matching: favoriteArtist) { (fetchedArtist) in
    print(fetchedArtist)
}












//let url = baseURL.withQueries(favoriteArtist)!
//let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//    if let data = data,
//        let string = String(data: data, encoding: .utf8) {
//        print(string)
//    }
//    PlaygroundPage.current.finishExecution()
//}
//
//task.resume()
