//
//  Hookah.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 15.08.2022.
//

import Foundation

struct Hookah : Identifiable, Decodable {
    var id : Int
    var title : String
    var bowl : ElementHookah
    var flask : ElementHookah
    var tobacco : [Product]
}
