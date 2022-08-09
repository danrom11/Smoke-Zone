//
//  BlockNews.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 20.05.2022.
//

import SwiftUI

struct BlockNews: View {
    
    var news : News
    
    var body: some View{
        ZStack{
            HStack{
                ZStack{
                    Image(news.Image).resizable()
                    VStack{
                        Spacer()
                        HStack(){
                            Text(news.textNews)
                                .foregroundColor(news.textNewsColor)
                                
                                .padding(.leading)
                                .padding(.bottom, 50)
                                .padding(.top, 20)
                                //.background(block.backColor)
                                
                            Spacer()
                        }.overlay(RoundedRectangle(cornerRadius: 25).stroke(LinearGradient(gradient: Gradient(colors: [news.backColor, news.textNewsColor]), startPoint: .leading, endPoint: .trailing), lineWidth: 5))
                            .shadow(color: .black, radius: 20, x: 0, y: 0)
                           .padding()
                           .shadow(color: news.backColor, radius: 7, x: 0, y: 7)
                           

                    }
                    
                    //.padding(.bottom)
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: 420)
            .background(news.backColor)
            .cornerRadius(25)
            .padding(.leading)
            .padding(.trailing)
            .padding(.bottom)
            .shadow(color: news.backColor.opacity(4), radius: 10, x: 0, y: 7)
    }
}

struct BlockNews_Previews: PreviewProvider {
    static var previews: some View {
        BlockNews(news: News(textNews: "Привет! Тест Надписи Привет! Тест Надписи Привет! Тест Надписи Привет! Тест Надписи", textNewsColor: .white, Image: "news1", backColor: .cyan))
    }
}
