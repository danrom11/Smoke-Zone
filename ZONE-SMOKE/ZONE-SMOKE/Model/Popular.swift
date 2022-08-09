//
//  Popular.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 20.05.2022.
//

import Foundation
import SwiftUI

struct Popular : Identifiable {
    var id = UUID().uuidString
    var text : String
    var textColor : Color
    var backColor : Color
    var image : String
}
