//
//  TopTAB.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 21.04.2022.
//

import SwiftUI

struct TopTabView: View {
    
    @State var showProfile = false
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
                HStack{
                    Button(action: {
                        self.showProfile.toggle()
                    }, label: {
                        Image(systemName: "person")
                            .font(.largeTitle)
                            .frame(width: 65, height: 65)
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    })
                    
                    
                }
                .background(.white)
                .clipShape(Circle())
                .padding()
                .sheet(isPresented: $showProfile){
                    ProfileView()
                }
                
            }
            .background(LinearGradient(gradient: Gradient(colors: [.teal, .purple]), startPoint: .leading, endPoint: .trailing))
            //.clipShape(Capsule())
            .cornerRadius(35)
            .padding()
            .padding(.top, 25)
            Spacer()
        }.edgesIgnoringSafeArea(.all)
        
    }
}

struct TopTAB_Previews: PreviewProvider {
    static var previews: some View {
        TopTabView()
    }
}
