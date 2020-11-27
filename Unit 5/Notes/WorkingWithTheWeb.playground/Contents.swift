import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
//
//
//
//
//let url = URL(string: "https://www.apple.com")!
//print(url.scheme!)
//print(url.host!)
//print(url.query)
//
//
//let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//    if let data = data,
//        let string = String(data: data, encoding: .utf8) {
//        print(string)
//    }
//    PlaygroundPage.current.finishExecution()
//}
//
//task.resume()


// USING THE NASA API

//let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")!

struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case description = "explanation"
        case url
        case copyright
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try valueContainer.decode(String.self, forKey: CodingKeys.title)
        self.description = try valueContainer.decode(String.self, forKey: CodingKeys.description)
        self.url = try valueContainer.decode(URL.self, forKey: CodingKeys.url)
        self.copyright = try? valueContainer.decode(String.self, forKey: CodingKeys.copyright)
    }
}


extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

//let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
//let query: [String: String] = [
//    "api_key": "DEMO_KEY",
//]
//let url = baseURL.withQueries(query)!
//
//let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//    let jsonDecoder = JSONDecoder()
//    if let data = data,
//        let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
//        print(photoInfo)
//    }
//    PlaygroundPage.current.finishExecution()
//}
//task.resume()

func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void) {
    let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
    let query: [String: String] = [
        "api_key": "DEMO_KEY",
    ]
    let url = baseURL.withQueries(query)!
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        let jsonDecoder = JSONDecoder()
        if let data = data,
            let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
            completion(photoInfo)
        } else {
            print("Either no data was returned, or data was not properly decoded.")
            completion(nil)
        }
        
        PlaygroundPage.current.finishExecution()
    }
    task.resume()
}

fetchPhotoInfo { (fetchedInfo) in
    print(fetchedInfo)
}

//func performLongRunningOperation(completion: @escaping () -> Void) {
//
//    completion()
//}
