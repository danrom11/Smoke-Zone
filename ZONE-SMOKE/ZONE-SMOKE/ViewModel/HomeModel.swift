//
//  HomeModel.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 20.05.2022.
//

import Foundation

class HomeModel : ObservableObject{
   static let shared = HomeModel()
    
    @Published var baseNews = [
        News(textNews: "Привет! Тест Надписи Привет! Тест Надписи Привет! Тест Надписи Привет! Тест Надписи", textNewsColor: .white, Image: "news1", backColor: .cyan),
        News(textNews: "Привет! Тест Надписи Привет! Тест Надписи Привет! Тест Надписи Привет! Тест Надписи", textNewsColor: .white, Image: "news1", backColor: .cyan)
    ]
    
    @Published var basePopular = [
        Popular(text: "Test", textColor: .purple, backColor: .teal, image: "smoke1"),
        Popular(text: "Test 2", textColor: .blue, backColor: .green, image: "smoke2"),
        Popular(text: "Test 3", textColor: .blue, backColor: .purple, image: "smoke2"),
        Popular(text: "Test 4", textColor: .white, backColor: .indigo, image: "smoke2"),
        Popular(text: "Test 5", textColor: .blue, backColor: .teal, image: "smoke2"),
        Popular(text: "Test 6", textColor: .blue, backColor: .teal, image: "smoke2")
    ]
}
