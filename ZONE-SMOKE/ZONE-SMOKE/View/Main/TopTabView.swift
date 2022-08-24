//
//  TopTAB.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 21.04.2022.
//

import SwiftUI

struct TopTabView: View {
    
    @State var showProfile = false
    @State var showPhotoPicker = false
    
    @State var avatarImage = UIImage()
    @State var selectedAvatar : Int
    
    @ObservedObject var connectUser = NetworkModel.shared
    
    var body: some View {
        VStack{
            HStack{
                VStack{
                    HStack{
                        Text("ZОНА-DЫМА")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding(.leading)
                            .padding(.trailing)
                            .padding(.top)
                            .padding(.bottom, 3)
                        Spacer()
                    }
                    HStack{
                        Image(systemName: "smoke")
                            .foregroundColor(.white)
                            .font(.title)
                        Text("Дыма: \(connectUser.userProfile.bonus)")
                            .foregroundColor(.white)
                            .font(.title2)
                        Spacer()
                    }
                    .padding(.leading)
                    .padding(.bottom)
                    
                }
                Spacer()
                ZStack(alignment: .bottomTrailing){
                    HStack{
                        Button(action: {
                            self.showProfile.toggle()
                        }, label: {
                            if(connectUser.selectedAvatar == 0){
                                Image(systemName: "person")
                                    .font(.system(size: 32))
                                    .frame(width: 65, height: 65)
                                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            } else {
                                Image(uiImage: connectUser.userAvatar)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 65, height: 65)
                                    .clipShape(Circle())
                            }
                            
                        })
                        
                        
                    }
                    .background(.white)
                    .clipShape(Circle())
                    .padding(.trailing)
                    .sheet(isPresented: $showProfile){
                        ProfileView()
                            .preferredColorScheme(.dark)
                    }
                    
                    HStack{
                        Button(action: {
                            showPhotoPicker.toggle()
                        }, label: {
                            
                            Image(systemName: "plus.circle")
                                .foregroundColor(.teal)
                                .font(.system(size: 16))
                                .padding(.trailing)
                            
                            
                        })
                    }.sheet(isPresented: $showPhotoPicker, content: {
                        PhotoPicker()
                            .ignoresSafeArea(.all)
                    })
                    
                }
                
            }
            .background(LinearGradient(gradient: Gradient(colors: [.teal, .purple]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(35)
            .padding()
            .padding(.top, 25)
            Spacer()
            
        }.edgesIgnoringSafeArea(.all)
        
    }
}

struct TopTAB_Previews: PreviewProvider {
    static var previews: some View {
        TopTabView(selectedAvatar: 0)
    }
}
