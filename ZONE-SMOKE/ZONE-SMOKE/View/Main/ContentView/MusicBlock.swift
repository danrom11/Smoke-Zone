//
//  MusicBlock.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 13.07.2022.
//

import SwiftUI

struct MusicBlock: View {
    
    var music : Music
    @ObservedObject var connectMusic = MusicModel.shared
    
    var body: some View {
        HStack{
           
            VStack(alignment: .leading){
                Text(music.name)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .font(.system(size: 28, weight: .light))
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.indigo, .teal]), startPoint: .leading, endPoint: .trailing))
                    
                Text(music.artist)
                    .lineLimit(1)
                    .minimumScaleFactor(0.2)
                    .font(.system(size: 16, weight: .light))
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.indigo, .teal]), startPoint: .leading, endPoint: .trailing))
                Spacer()
            }
            .padding()
                Spacer()
            
            Button(action: {
                connectMusic.musicSelected = music
            }, label: {
                Image(systemName: connectMusic.musicSelected.id != music.id ? "plus.circle" : "checkmark.circle")
                    .font(.system(size: 50, weight: .light))
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.cyan, .indigo]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .padding(.trailing)
            })
            
            
            
        }.frame(width: UIScreen.main.bounds.width - 30, height: 100)
        //    .padding()
            .overlay(RoundedRectangle(cornerRadius: 35).stroke(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing), lineWidth: 3))
          //  .padding()
    }
}

struct MusicBlock_Previews: PreviewProvider {
    static var previews: some View {
        MusicBlock(music: Music(id: 0, name: "Белый снег", artist: "Пилот"))
    }
}
