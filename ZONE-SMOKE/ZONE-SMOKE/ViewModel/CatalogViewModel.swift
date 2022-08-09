//
//  CatalogViewModel.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 02.05.2022.
//

import Foundation

class CatalogViewModel : ObservableObject{
    static let shared = CatalogViewModel()
    
//    @Published var productsTabacco = [
//        Product(id: 32, title: "Barvy Orange", imageUrl: "orangeTOBAK", price: 300, descript: "Вкус состоит из ароматизаторов помело, который является основным, и грейпфрута,я бедный мальчик мз Эстонии, меня держат в рабстве, поиогите мне и скиньте деньги на карту  который используется для придания вкуса цедра и горчинки. Сама аромка помело имеет кислинку и больше напоминает мякоть этого цитруса.", brand: "DarkSide (Core)", taste: ["Апельсин", "Грейпфрукт"], strong: 1, count: 1),
//        Product(id: 55, title: "Barvy Orange", imageUrl: "orangeTOBAK", price: 300, descript: "Вкус состоит из ароматизаторов помело, который является основным, и грейпфрута,я бедный мальчик мз Эстонии, меня держат в рабстве, поиогите мне и скиньте деньги на карту  который используется для придания вкуса цедра и горчинки. Сама аромка помело имеет кислинку и больше напоминает мякоть этого цитруса.", brand: "MustHave", taste: ["Апельсин", "Грейпфрукт", "Лимон"], strong: 1, count: 1),
//        Product(id: 76, title: "Barvy Orange", imageUrl: "orangeTOBAK", price: 300, descript: "Вкус состоит из ароматизаторов помело, который является основным, и грейпфрута,я бедный мальчик мз Эстонии, меня держат в рабстве, поиогите мне и скиньте деньги на карту  который используется для придания вкуса цедра и горчинки. Сама аромка помело имеет кислинку и больше напоминает мякоть этого цитруса.", brand: "Chabacco (Medium)", taste: ["Апельсин", "Грейпфрукт", "Лимон"], strong: 1, count: 1),
//        Product(id: 11, title: "Barvy Orange", imageUrl: "orangeTOBAK", price: 300, descript: "Вкус состоит из ароматизаторов помело, который является основным, и грейпфрута,я бедный мальчик мз Эстонии, меня держат в рабстве, поиогите мне и скиньте деньги на карту  который используется для придания вкуса цедра и горчинки. Сама аромка помело имеет кислинку и больше напоминает мякоть этого цитруса.", brand: "Chabacco (Medium)", taste: ["Апельсин", "Грейпфрукт", "Лимон"], strong: 1, count: 1),
//        Product(id: 7, title: "Barvy Orange", imageUrl: "orangeTOBAK", price: 300, descript: "Вкус состоит из ароматизаторов помело, который является основным, и грейпфрута,я бедный мальчик мз Эстонии, меня держат в рабстве, поиогите мне и скиньте деньги на карту  который используется для придания вкуса цедра и горчинки. Сама аромка помело имеет кислинку и больше напоминает мякоть этого цитруса.", brand: "Satyr (Aroma Line)", taste: ["Апельсин", "Грейпфрукт", "Лимон"], strong: 1, count: 1)
//    ]
//
//    @Published var productsFood = [
//        Product(id: 76, title: "Салат цезарь", imageUrl: "salat", price: 300, descript: "Мой родной салатик", brand: "Салаты", taste: ["Курица", "Сыр", "Салат", "Чери", "Гренки"], strong: 300, count: 1),
//        Product(id: 98, title: "Салат МОРК", imageUrl: "salat", price: 300, descript: "Мой родной салатик", brand: "Салаты", taste: ["Курица", "Сыр", "Салат", "Чери", "Гренки"], strong: 300, count: 1),
//        Product(id: 32, title: "Салат КАПУС", imageUrl: "salat", price: 300, descript: "Мой родной салатик", brand: "Салаты", taste: ["Курица", "Сыр", "Салат", "Чери", "Гренки"], strong: 300, count: 1),
//        Product(id: 764, title: "SSS цезарь", imageUrl: "salat", price: 300, descript: "Мой родной салатик", brand: "Салаты", taste: ["Курица", "Сыр", "Салат", "Чери", "Гренки"], strong: 300, count: 1),
//        Product(id: 265, title: "FDFD МОРК", imageUrl: "salat", price: 300, descript: "Мой родной салатик", brand: "Салаты", taste: ["Курица", "Сыр", "Салат", "Чери", "Гренки"], strong: 300, count: 1),
//        Product(id: 657, title: "bbbb КАПУС", imageUrl: "salat", price: 300, descript: "Мой родной салатик", brand: "Салаты", taste: ["Курица", "Сыр", "Салат", "Чери", "Гренки"], strong: 300, count: 1)
//    ]
    
    @Published var productsTabacco = [Product]()
    
    @Published var productsFood = [Product]()
    
    
    @Published var cartTabacco = [Product]()
//        @Published var cartTabacco = [
//            Product(id: 4343, title: "Салат цезарь", imageUrl: "salat", price: 300, descript: "Мой родной салатик", brand: "Салаты", taste: ["Курица", "Сыр", "Салат", "Чери", "Гренки"], strong: 300, count: 1)
//
//        ]
//
    @Published var cartFood = [Product]()
//    @Published var cartFood = [
//        Product(title: "Салат цезарь", imageUrl: "salat", price: 300, descript: "Мой родной салатик", brand: "Салаты", taste: ["Курица", "Сыр", "Салат", "Чери", "Гренки"], strong: 300, count: 1)
//
//    ]
    
    func serchIndex(product : Product, array : [Product]) -> Int{
        for item in 0..<array.count{
            if array[item].id == product.id{
                return item
            }
        }
        fatalError("Index not found in cart")
    }
    
    func checkProductInCartFood(product : Product) -> Int {
        for i in 0..<cartFood.count{
            if product.id == cartFood[i].id {
                return cartFood[i].count
            }
        }
        return 0
    }
    
    func addProductCountCartFood(id : Int){
        cartFood[id].count += 1
    }
    
    func removeProductCountCartFood(id : Int){
        cartFood[id].count -= 1
        if(cartFood[id].count <= 0){
            cartFood.remove(at: id)
        }
    }
    
    func priceFood() -> Decimal {
        var price : Decimal = 0
        
        for i in 0..<cartFood.count {
            price += (cartFood[i].price * Decimal(cartFood[i].count))
        }
        return price
    }
    
    func searchFilter(product : Product, filter: String) -> Bool{
        for i in 0..<product.taste.count {
            if ( product.title.lowercased().contains(filter.lowercased()) || product.brand.lowercased().contains(filter.lowercased()) || product.taste[i].lowercased().contains(filter.lowercased())){
                return true
            }
        }
        return false
    }
    
    
}
