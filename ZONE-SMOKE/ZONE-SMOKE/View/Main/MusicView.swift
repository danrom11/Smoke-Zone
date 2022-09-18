//
//  MusicView.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 13.07.2022.
//

import SwiftUI
import PopupView

struct MusicView: View {
    
    @State private var searchMusic = ""
    
    @ObservedObject var connectMusic = MusicModel.shared
    @ObservedObject var connectNetwork = NetworkModel.shared
    
    @State var showMusicSelected : Bool = false
    
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
                
                
            VStack{
                ZStack{
                    HStack{
                        Text("Заказать музыку")
                            .font(.system(size: 32))
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            .padding(.leading)
                        Spacer()
                    }
                }
               
                
                HStack{
                    
                    TextField("Поиск...", text: $searchMusic, onCommit: {
                        NetworkModel.shared.getMusics(term: self.searchMusic)
                    })
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                    Button(action: {
                        NetworkModel.shared.getMusics(term: self.searchMusic)
                    }, label: {
                        Image(systemName: "magnifyingglass.circle")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                    })
                    
//                    if(showMusicSelected == false && connectMusic.musicSelected.id != -1){
//                        Button(action: {
//
//                        }, label: {
//                            Image(systemName: "music.note")
//                                .font(.system(size: 25))
//                                .foregroundColor(.white)
//
//                        })
//
//                    }
                }
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [.indigo, .cyan]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(35)
                .padding(.horizontal)
                
                
                ZStack(alignment: .topTrailing){
                    
                    ScrollView(.vertical, showsIndicators: false, content: {
                        ForEach(connectMusic.musics){item in
                            if(item.name != "null" && item.artist != "null"){
                                MusicBlock(music: item, showMusicSelected: $showMusicSelected)
                                    .padding(.horizontal)
                                    .padding(.top, 10)
                            }
                            
                        }
                        HStack{}.padding(.top, 110)
                    })
                    
                    if(showMusicSelected == false && connectMusic.musicSelected.id != -1){
                        Button(action: {
                            showMusicSelected = true
                        }, label: {
                            Image(systemName: "music.note")
                                .font(.system(size: 25))
                                .foregroundColor(.white)
                               
                                .padding()
                                .background(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing))
                                .clipShape(Circle())
                               
                                
                        }).padding()
                        
                    }
                }
                
                
                   
                
                Spacer()
            }
            
            
            
            
            
        }
            .popup(isPresented: $showMusicSelected, type: .floater(verticalPadding: 0, useSafeAreaInset: true), position: .top, closeOnTap: false, dismissCallback: {
                print("test")
            }){
                if(connectMusic.musicSelected.id != -1){
                    ZStack{
                        VStack{
                            
                            Image(systemName: "chevron.compact.up")
                                .foregroundColor(.white)
                                .font(.system(size: 15))
                                .padding(.top, 5)
                            
                            if(connectNetwork.userProfile.id != -1){
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("Музыка: \(connectMusic.musicSelected.name)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20))
                                        Text("Автор: \(connectMusic.musicSelected.artist)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 12))
                                    }
                                    
                                    
                                    Spacer()
                                    
                                    
                                    if(connectNetwork.userProfile.bonus >= connectMusic.priceMusics){
                                        Text("Поставить песню за \(connectMusic.priceMusics)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15))
                                        
                                        Button(action: {
                                            
                                        }, label: {
                                            Image(systemName: "music.note.list")
                                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing))
                                                .font(.system(size: 15))
                                                .padding()
                                                .background(.white)
                                                .clipShape(Circle())
                                        })
                                    } else {
                                        VStack(alignment: .leading){
                                            Text("У вас не достаточно бонусов")
                                                .foregroundColor(.white)
                                                .font(.system(size: 15))
                                            Text("У вас: \(connectNetwork.userProfile.bonus), стоимость песни \(connectMusic.priceMusics)")
                                                .foregroundColor(.white)
                                                .font(.system(size: 12))
                                        }
                                       
                                    }
                                    
                                    
                                }.padding()
                                Spacer()
                                
                                
                                
                            } else {
                                Spacer()
                                Text("Войдите в аккаунт")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                                
                                Button(action: {
                                    
                                }, label: {
                                    HStack{
                                        Text("Войти")
                                            .foregroundColor(.white)
                                            .font(.system(size: 25))
                                    }
                                    .padding(10)
                                    .overlay(RoundedRectangle(cornerRadius: 25).stroke(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing), lineWidth: 3))
                                })
                            }
                            Spacer()
                            
                        }
                    }.frame(width: UIScreen.main.bounds.width, height: 120)
                        .background(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                        .cornerRadius(35)
                }
            }.edgesIgnoringSafeArea(.bottom)
        
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView()
    }
}
