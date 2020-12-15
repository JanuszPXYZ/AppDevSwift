//
//  Order.swift
//  RestaurantTakeTwo
//
//  Created by Janusz Polowczyk on 02/12/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
