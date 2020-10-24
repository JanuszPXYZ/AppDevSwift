//
//  Room.swift
//  HomeFurnitureFromScratch
//
//  Created by Janusz Polowczyk on 22/10/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import Foundation

struct Room {
    let name: String
    let furniture: [Furniture]
    
    init(name: String, furniture: [Furniture]) {
        self.name = name
        self.furniture = furniture
    }
}
