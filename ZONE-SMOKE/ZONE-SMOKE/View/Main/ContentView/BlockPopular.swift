//
//  BlockPopular.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 20.05.2022.
//

import SwiftUI

struct BlockPopular: View {
    
    var popular : Popular
    var color : [Color] = [.teal, .indigo, .mint]
    
    @State var showPopular = false
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    ZStack{
                        Button(action: {
                            self.showPopular.toggle()
                        }, label: {
                            
                            AsyncImage(url: URL(string: popular.image.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)!, placeholder: { ProgressView() }, image: { image in
                                
                                Image(uiImage: image)
                                    .resizable()

                            }).blur(radius: 2)
                            
                            
//                            Image(popular.image)
//                                .resizable()
//                                .blur(radius: 2)
                        })
                        .sheet(isPresented: $showPopular){
                            PopularView(popular: popular)
                        }
                        Text(popular.text)
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [color[Int.random(in: 0..<color.count)], color[Int.random(in: 0..<color.count)], color[Int.random(in: 0..<color.count)]]), startPoint: .topLeading, endPoint: .bottomTrailing)).font(.headline)
                    }
                    
                }
            }
        }.frame(width: 100, height: 100)
            .background(color[Int.random(in: 0..<color.count)])
            .cornerRadius(30)
            .padding(.leading)
            .padding(.bottom)
            .padding(.trailing)
            .shadow(color: color[Int.random(in: 0..<color.count)].opacity(4), radius: 10, x: 0, y: 7)
    }
}

struct BlockPopular_Previews: PreviewProvider {
    static var previews: some View {
        BlockPopular(popular: Popular(id: 0, text: "Меню", image: "https://sun9-55.userapi.com/impg/CTmR4e0ZfKDfsBuENQLDY6hX0XhBQ41t6FI1Vw/qjlcfTvwLIc.jpg?size=904x1280&quality=95&sign=ec6a6e40e53509d616003bded4a64a16&type=album"))
    }
}
