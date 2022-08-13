//
//  HookahAssemblyModel.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 12.08.2022.
//

import Foundation

class HookahAssemblyModel : ObservableObject {
    static var shared = HookahAssemblyModel()
    
    @Published var bowls = [
        ElementHookah(id: 0, image: "hookahStandart", text: "На чаше", typeObject: "standart"),
        ElementHookah(id: 1, image: "hookahOrange", text: "На апельсине", typeObject: "orange"),
        ElementHookah(id: 2, image: "hookahPineapple", text: "На ананасе", typeObject: "pineapple"),
        ElementHookah(id: 3, image: "hookahGrapefruit", text: "На грейпфрукте", typeObject: "grapefruit")
    ]
    @Published var selectedBowl = ElementHookah(id: -1, image: "null", text: "null", typeObject: "null")
    
    @Published var flasks = [
        ElementHookah(id: 0, image: "InBotleWater", text: "На воде", typeObject: "water"),
        ElementHookah(id: 1, image: "InBotleJuice", text: "На соке", typeObject: "juice"),
        ElementHookah(id: 2, image: "InBotleMilk", text: "На молоке", typeObject: "milk"),
        ElementHookah(id: 3, image: "InBotleAlcohol", text: "На алкоголе", typeObject: "alcohol")
    ]
    @Published var selectedFlask = ElementHookah(id: -1, image: "null", text: "null", typeObject: "null")
    
}
