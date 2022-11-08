//
//  News.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 20.05.2022.
//

import Foundation
import SwiftUI

struct News : Identifiable, Decodable {
    var id : Int
    var title : String
    var date : String
    var image : String
    var text : String
}
