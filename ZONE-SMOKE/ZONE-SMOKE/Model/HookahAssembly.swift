//
//  HookahAssembly.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 25.08.2022.
//

import Foundation

struct HookahAssembly : Identifiable, Decodable, Encodable {
    var id : Int
    var title : String
    var hookah : [Hookah]
}

