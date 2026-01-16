//
//  Registration.swift
//  guestRegistration
//
//  Created by GEU on 12/01/26.
//

import Foundation

struct Reservation {
    var firstName: String
    var lastName: String
    var email: String
    var checkInDate: Date
    var checkOutDate: Date
    var numberOfAdults: Int
    var numberOfChildren: Int
    var wifi: Bool
    var roomType: RoomType
    
}
