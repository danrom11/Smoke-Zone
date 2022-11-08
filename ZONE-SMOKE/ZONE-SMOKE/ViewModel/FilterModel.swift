//
//  FilterModel.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 19.05.2022.
//

import Foundation

class FilterModel : ObservableObject{
    static let shared = FilterModel()
    
//    @Published var tabaccoFilters = [
//        Filter(id: 1, title: "MustHave"),
//        Filter(id: 2, title: "DarkSide (Core)"),
//        Filter(id: 3, title: "BlackBurn"),
//        Filter(id: 4, title: "Daily Hookah"),
//        Filter(id: 5, title: "Satyr (Aroma Line)"),
//        Filter(id: 6, title: "Chabacco (Medium)"),
//        Filter(id: 7, title: "Element"),
//        Filter(id: 8, title: "Smoke Angels"),
//        Filter(id: 9, title: "Северный")
//    ]
//
//    @Published var foodFilters = [
//        Filter(id: 1, title: "Салаты"),
//        Filter(id: 2, title: "Десерты"),
//        Filter(id: 3, title: "Чай"),
//        Filter(id: 4, title: "Кофе"),
//        Filter(id: 5, title: "Снеки"),
//        Filter(id: 6, title: "Соусы"),
//        Filter(id: 7, title: "Напитки"),
//        Filter(id: 8, title: "Б/А Напитки"),
//        Filter(id: 9, title: "Ал. Напитки"),
//        Filter(id: 10, title: "Коктейли"),
//        Filter(id: 11, title: "Шоты"),
//        Filter(id: 12, title: "Пиво")
//    ]
    
    @Published var tabaccoFilters = [Filter]()
    @Published var foodFilters = [Filter]()
    
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
