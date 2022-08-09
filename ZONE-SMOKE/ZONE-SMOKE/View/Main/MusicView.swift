//
//  MusicView.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 13.07.2022.
//

import SwiftUI

struct MusicView: View {
    
    @State private var searchMusic = ""
    
    @ObservedObject var connectMusic = MusicModel.shared
    
    var body: some View {
        ZStack{
            Color.black
                
                
            VStack{
                HStack{
                    Button(action: {
                        print(connectMusic.musics)
                    }, label: {
                        Text("Заказать музыку")
                            .font(.system(size: 30))
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .trailing))
                            .padding(.leading, 30)
                            .padding(.top, 40)
                    })
                    
                    
                    Spacer()
                }
               
                
                HStack{
                    TextField("Поиск...", text: $searchMusic)
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                    Button(action: {
                        NetworkModel.shared.getMusics(term: self.searchMusic)
                    }, label: {
                        Image(systemName: "magnifyingglass.circle")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                    })
                }
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [.indigo, .cyan]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(35)
                .padding(.horizontal)
                
                
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    ForEach(connectMusic.musics){item in
                        if(item.name != "null" && item.artist != "null"){
                            MusicBlock(music: item)
                                .padding(.horizontal)
                                .padding(.top, 10)
                        }
                        
                    }
                    HStack{}.padding(.top, 110)
                })
                
                   
                
                Spacer()
            }
            
            
            
            
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView()
    }
}
