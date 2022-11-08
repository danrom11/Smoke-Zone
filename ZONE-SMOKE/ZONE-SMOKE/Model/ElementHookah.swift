//
//  ElementHookah.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 12.08.2022.
//

import Foundation

struct ElementHookah : Identifiable, Decodable, Encodable {
    var id : Int
    var price : Decimal
    var image : String
    var text : String
    var typeObject : String
}
