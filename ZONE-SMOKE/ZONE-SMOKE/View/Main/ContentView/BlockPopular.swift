//
//  BlockPopular.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 20.05.2022.
//

import SwiftUI

struct BlockPopular: View {
    
    var popular : Popular
    @State var showPopular = false
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    ZStack{
                        Button(action: {
                            self.showPopular.toggle()
                        }, label: {
                            Image(popular.image)
                                .resizable()
                                .blur(radius: 2)
                        })
                        .sheet(isPresented: $showPopular){
                            PopularView(popular: popular)
                        }
                        Text(popular.text).foregroundStyle(LinearGradient(gradient: Gradient(colors: [popular.textColor, .teal, .indigo]), startPoint: .topLeading, endPoint: .bottomTrailing)).font(.headline)
                    }
                    
                }
            }
        }.frame(width: 100, height: 100)
            .background(popular.backColor)
            .cornerRadius(30)
            .padding(.leading)
            .padding(.bottom)
            .padding(.trailing)
            .shadow(color: popular.backColor.opacity(4), radius: 10, x: 0, y: 7)
    }
}

struct BlockPopular_Previews: PreviewProvider {
    static var previews: some View {
        BlockPopular(popular: Popular(text: "Test", textColor: .purple, backColor: .teal, image: "smoke1"))
    }
}
