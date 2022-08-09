//
//  FilterModel.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 19.05.2022.
//

import Foundation

class FilterModel : ObservableObject{
    static let shared = FilterModel()
    
    @Published var tabaccoFilters = [
        Filter(title: "MustHave"),
        Filter(title: "DarkSide (Core)"),
        Filter(title: "BlackBurn"),
        Filter(title: "Daily Hookah"),
        Filter(title: "Satyr (Aroma Line)"),
        Filter(title: "Chabacco (Medium)"),
        Filter(title: "Element"),
        Filter(title: "Smoke Angels"),
        Filter(title: "Северный")
    ]
    
    @Published var foodFilters = [
        Filter(title: "Салаты"),
        Filter(title: "Десерты"),
        Filter(title: "Чай"),
        Filter(title: "Кофе"),
        Filter(title: "Снеки"),
        Filter(title: "Соусы"),
        Filter(title: "Напитки"),
        Filter(title: "Б/А Напитки"),
        Filter(title: "Ал. Напитки"),
        Filter(title: "Коктейли"),
        Filter(title: "Шоты"),
        Filter(title: "Пиво")
    ]
    
    @Published var userFilters = [Filter]()
    
//    func searchFilter(product : Product, search: String) -> Bool{
//        if(userFilters.count > 0){
//            for i in 0..<userFilters.count{
//                print("Я СМОТРЮ \(userFilters.count)")
//                if (product.brand.lowercased() == userFilters[i].title.lowercased()){
//                    if search.count > 0 {
//                        for i in 0..<product.taste.count {
//                            if ( product.title.lowercased().contains(search.lowercased()) || product.brand.lowercased().contains(search.lowercased()) || product.taste[i].lowercased().contains(search.lowercased())){
//                                return true
//                            }
//                        }
//                    }else {
//                        return true
//                    }
//
//                } else {
//                    return false
//                }
//            }
//        }else{
//            for i in 0..<product.taste.count {
//                if ( product.title.lowercased().contains(search.lowercased()) || product.brand.lowercased().contains(search.lowercased()) || product.taste[i].lowercased().contains(search.lowercased())){
//                    return true
//                }
//            }
//        }
//        return false
//    }
    
    
    
    func searchFilter(product : Product, search : String) -> Bool {
        if(userFilters.count > 0){
            for i in 0..<userFilters.count{
                if userFilters[i].title.lowercased() == product.brand.lowercased(){
                    if(search.count > 0){
                        for itemSerch in 0..<product.taste.count{
                            if ( product.title.lowercased().contains(search.lowercased()) || product.brand.lowercased().contains(search.lowercased()) || product.taste[itemSerch].lowercased().contains(search.lowercased())){
                                return true
                            }
                        }
                    } else {
                        return true
                    }
                }
            }
            return false
        }else{
            for i in 0..<product.taste.count {
                if ( product.title.lowercased().contains(search.lowercased()) || product.brand.lowercased().contains(search.lowercased()) || product.taste[i].lowercased().contains(search.lowercased())){
                    return true
                }
            }
        }
        return false
    }
    
    func serchIndexFilter(filter : Filter) -> Int{
        for item in 0..<userFilters.count{
            if userFilters[item].id == filter.id{
                return item
            }
        }
        fatalError("Index not found in cart")
    }
    
    func pr(){
        print(userFilters)
    }
}
