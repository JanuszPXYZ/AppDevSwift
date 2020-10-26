//
//  Registration.swift
//  HotelManzana
//
//  Created by Janusz Polowczyk on 25/10/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import Foundation

struct Registration {
    var firstName: String
    var lastName: String
    var emailAddress: String
    
    var checkIn: Date
    var checkOut: Date
    
    var noOfAdults: Int
    var noOfChildren: Int
    var roomChoice: RoomType
    var wifiAccess: Bool
}

struct RoomType: Equatable {
    enum roomBedtype {
        case twoQueen, oneKing, twoKing
        }
    var roomChoice: roomBedtype
    var id: Int
    var name: String
    var shortName: String
    var price: Double
    
    
    static func ==(lhs: RoomType, rhs: RoomType) -> Bool {
    return lhs.id == rhs.id
    }
    
    static var all: [RoomType] {
        return [RoomType(roomChoice: .twoQueen, id: 0, name: "Two Queens", shortName: "2Q", price: 179),
                RoomType(roomChoice: .oneKing, id: 1, name: "One King", shortName: "K", price: 209),
                RoomType(roomChoice: .twoKing, id: 2, name: "Penthouse Suite", shortName: "PHS", price: 309)]
    }
}



//struct RoomType: Equatable {
//    var id: Int
//    var name: String
//    var shortName: String
//    var price: Int
//
//static func ==(lhs: RoomType, rhs: RoomType) -> Bool {
//    return lhs.id == rhs.id
//}
//}


