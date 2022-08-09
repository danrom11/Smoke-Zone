//
//  testClass.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 02.05.2022.
//

import Foundation



class Counter: ObservableObject{
    struct testStruct : Identifiable{
        var id = UUID().uuidString
        var text : String
    }
    
    @Published var testlist = [
        testStruct(text: "test 0"),
        testStruct(text: "test 1")
    ]
}
