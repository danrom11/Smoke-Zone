//
//  MusicModel.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 14.07.2022.
//

import Foundation

class MusicModel : ObservableObject {
    static let shared = MusicModel()
    
    
    @Published var musicSelected : Music = Music(id: -1, name: "null", artist: "null")
    
    @Published var musics = [Music]()
    
    @Published var priceMusics : Int = 20
    
}
