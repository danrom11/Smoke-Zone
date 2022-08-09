//
//  Product.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 02.05.2022.
//

import Foundation

struct Product : Identifiable, Decodable {
    var id : Int //= UUID().uuidString
    var title : String
    var imageUrl : String
    var price : Decimal
    var descript: String
    var brand : String
    var taste : [String]
    var strong : Int
    var count : Int
}
