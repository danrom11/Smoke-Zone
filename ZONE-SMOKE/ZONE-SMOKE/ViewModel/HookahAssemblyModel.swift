//
//  HookahAssemblyModel.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 12.08.2022.
//

import Foundation

class HookahAssemblyModel : ObservableObject {
    static let shared = HookahAssemblyModel()
    
    @Published var bowls = [
        ElementHookah(id: 0, price: 550, image: "hookahStandart", text: "Обычная", typeObject: "standart"),
        ElementHookah(id: 1, price: 900, image: "hookahOrange", text: "На апельсине", typeObject: "orange"),
        ElementHookah(id: 2, price: 900, image: "hookahGrapefruit", text: "На грейпфрукте", typeObject: "grapefruit")
    ]
    @Published var selectedBowl = ElementHookah(id: -1, price: 0, image: "null", text: "null", typeObject: "null")
    
    @Published var flasks = [
        ElementHookah(id: 0, price: 0, image: "InBotleWater", text: "На воде", typeObject: "water")
//        ElementHookah(id: 1, price: 0, image: "InBotleJuice", text: "На соке", typeObject: "juice"),
//        ElementHookah(id: 2, price: 0, image: "InBotleMilk", text: "На молоке", typeObject: "milk"),
//        ElementHookah(id: 3, price: 0, image: "InBotleAlcohol", text: "На алкоголе", typeObject: "alcohol")
    ]
    @Published var selectedFlask = ElementHookah(id: -1, price: 0, image: "null", text: "null", typeObject: "null")
    
    @Published var hookahs = [Hookah]()
    
    func removeHookah(hookah : Hookah){
        for item in 0..<hookahs.count{
            if(hookah.id == hookahs[item].id){
                hookahs.remove(at: item)
                break
            }
        }
    }
    
    @Published var myHookahAssembly = [HookahAssembly]()
    @Published var recommendedHookahAssembly = [HookahAssembly]()
    
    func checkMyHookahAssembly(hookahAssembly : HookahAssembly) -> Int {
        for item in 0..<myHookahAssembly.count {
            if(hookahAssembly.id == myHookahAssembly[item].id){
                return item
            }
        }
        return -1
    }
    
    func getPriceHookahs() -> Decimal{
        var price : Decimal = 0
        for item in 0..<hookahs.count{
            price += hookahs[item].bowl.price + hookahs[item].flask.price
        }
        return price
    }
    
    func loadMyHookahAssembly() {
        //UserDefaults.standard.removeObject(forKey: "myHookahAssembly")
        guard let data = UserDefaults.standard.data(forKey: "myHookahAssembly") else { return }
        myHookahAssembly = try! PropertyListDecoder().decode(Array<HookahAssembly>.self, from: data)
    }
}
