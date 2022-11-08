//
//  HomeModel.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 20.05.2022.
//

import Foundation

class HomeModel : ObservableObject{
   static let shared = HomeModel()
    
    @Published var baseNews = [News]()
    
    @Published var basePopular = [Popular]()
}
