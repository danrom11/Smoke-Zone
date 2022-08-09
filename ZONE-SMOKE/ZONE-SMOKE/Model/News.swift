//
//  News.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 20.05.2022.
//

import Foundation
import SwiftUI

struct News : Identifiable {
    var id = UUID().uuidString
    var textNews : String
    var textNewsColor : Color
    var Image : String
    var backColor : Color
}
