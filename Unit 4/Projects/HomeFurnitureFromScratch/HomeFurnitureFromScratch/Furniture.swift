//
//  Furniture.swift
//  HomeFurnitureFromScratch
//
//  Created by Janusz Polowczyk on 22/10/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import Foundation

struct Furniture {
    let name: String
    let description: String
    var image: Data?
    
    init(name: String, description: String, image: Data? = nil) {
        self.name = name
        self.description = description
        self.image = image
    }
}
