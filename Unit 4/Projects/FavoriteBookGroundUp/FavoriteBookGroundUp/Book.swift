//
//  Book.swift
//  FavoriteBookGroundUp
//
//  Created by Janusz Polowczyk on 19/10/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import Foundation

struct Book: CustomStringConvertible {
    var title: String
    var author: String
    var genre: String
    var length: String
    
    init(title: String, author: String, genre: String, length: String) {
        self.title = title
        self.author = author
        self.genre = genre
        self.length = length
    }
    
    // Creating a computed property for a description variable
    var description: String {
        return "\(self.title) was written by \(self.author) and its length is \(self.length) pages."
    }
}
