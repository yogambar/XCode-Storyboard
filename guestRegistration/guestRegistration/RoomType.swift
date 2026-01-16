//
//  RoomType.swift
//  guestRegistration
//
//  Created by GEU on 13/01/26.
//

import Foundation

struct RoomType: Equatable {
    var id: Int
    var name: String
    var shortName: String
    var price: Int

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }

    static var all: [Self] {
        return [
            Self(id: 0, name: "Two Queens", shortName: "2Q", price: 179),
            Self(id: 1, name: "One King", shortName: "K", price: 209),
            Self(id: 2, name: "Penthouse Suite", shortName: "PHS", price: 309)
        ]
    }
}
