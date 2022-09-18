//
//  BookingModel.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 31.08.2022.
//

import Foundation

class BookingModel : ObservableObject {
    static let shared = BookingModel()
    
    
    @Published var tables = [Booking](arrayLiteral:
        Booking(id: 1, booking: false),
        Booking(id: 2, booking: false),
        Booking(id: 3, booking: false),
        Booking(id: 4, booking: false),
        Booking(id: 5, booking: false),
        Booking(id: 6, booking: false),
        Booking(id: 7, booking: false),
        Booking(id: 8, booking: false),
        Booking(id: 9, booking: false),
        Booking(id: 10, booking: false)
    )
    
    @Published var selectedTable : Booking = Booking(id: -1, booking: false)
    
}
