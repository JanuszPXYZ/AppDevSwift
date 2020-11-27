//
//  StoreItem.swift
//  iTunesSearch
//
//  Created by Janusz Polowczyk on 23/11/2020.
//  Copyright © 2020 Caleb Hicks. All rights reserved.
//

import Foundation

struct StoreItem: Codable {
    var name: String
    var album: String
    var song: String
    var url: URL
    var artworkURL: URL
    var price: Double
    
    enum CodingKeys: String, CodingKey {
        case name = "artistName"
        case album = "collectionName"
        case song = "trackName"
        case url = "artistViewUrl"
        case artworkURL = "artworkUrl100"
        case price = "collectionPrice"
    }
    
    init(from decoder: Decoder) throws {
        let valueDecoder = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try valueDecoder.decode(String.self, forKey: CodingKeys.name)
        self.album = try valueDecoder.decode(String.self, forKey: CodingKeys.album)
        self.song = try valueDecoder.decode(String.self, forKey: CodingKeys.song)
        self.url = try valueDecoder.decode(URL.self, forKey: CodingKeys.url)
        self.artworkURL = try valueDecoder.decode(URL.self, forKey: CodingKeys.artworkURL)
        self.price = try valueDecoder.decode(Double.self, forKey: CodingKeys.price)
    }
}


struct StoreItems: Codable {
    let results: [StoreItem]
}
