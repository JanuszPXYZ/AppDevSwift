//
//  IntermediaryModels.swift
//  RestaurantTakeTwo
//
//  Created by Janusz Polowczyk on 02/12/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import Foundation

struct Categories: Codable {
    let categories: [String]
}

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
