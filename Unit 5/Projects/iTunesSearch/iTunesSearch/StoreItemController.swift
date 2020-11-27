//
//  StoreItemController.swift
//  iTunesSearch
//
//  Created by Janusz Polowczyk on 23/11/2020.
//  Copyright © 2020 Caleb Hicks. All rights reserved.
//

import Foundation



class StoreItemController {
    
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
        }
        task.resume()
    }
}

