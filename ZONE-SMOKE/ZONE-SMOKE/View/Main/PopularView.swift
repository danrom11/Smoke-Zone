//
//  PopularView.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 20.06.2022.
//

import SwiftUI
import AVKit

struct PopularView: View {
    //"https://bit.ly/swswift"
    var popular : Popular
    @State private var player = AVPlayer()
    
    var body: some View {
        ZStack{
            Image(popular.image)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

        }
//        ZStack{
//            VideoPlayer(player: player)
//                .edgesIgnoringSafeArea(.all)
//                .onAppear {
//                    player = AVPlayer(url: URL(string: "https://bit.ly/swswift")!)
//                    player.play()
//                }
//        }
        
        
    }
}

struct PopularView_Previews: PreviewProvider {
    static var previews: some View {
        PopularView(popular: Popular(text: "Test", textColor: .purple, backColor: .teal, image: "smoke1"))
    }
}

