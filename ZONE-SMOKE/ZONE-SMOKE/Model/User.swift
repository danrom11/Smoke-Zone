//
//  User.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 20.06.2022.
//

import Foundation

struct User : Identifiable, Decodable {
    var id : Int
    var mail : String
    var phone : String
    var userName : String
    var bonus : Int
}
