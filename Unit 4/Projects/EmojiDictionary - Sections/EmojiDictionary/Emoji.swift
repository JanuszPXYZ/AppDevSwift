//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Janusz Polowczyk on 14/10/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import Foundation


struct Emoji {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    init(symbol: String, name: String, description: String, usage: String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
}
