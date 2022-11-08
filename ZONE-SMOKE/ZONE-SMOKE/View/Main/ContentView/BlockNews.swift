//
//  BlockNews.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 20.05.2022.
//

import SwiftUI

struct BlockNews: View {
    
    var news : News
    
    var color : [Color] = [.teal, .indigo, .mint]
    
    @State var showDetailsNews = false
    
    var body: some View{
        ZStack{
            VStack(){
                HStack{
                    Text(news.date)
                        .foregroundColor(.gray)
                        .padding(.leading)
                    Spacer()
                }
                
                HStack{
                    Text(news.title)
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .padding(.leading)
                    Spacer()
                }
                
                HStack{
                    ZStack{
                        Button(action: {
                            self.showDetailsNews.toggle()
                        }, label: {
                            AsyncImage(url: URL(string: news.image.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)!, placeholder: {ProgressView()}, image: { image in
                                Image(uiImage: image)
                                    .resizable()
                                
                            }).scaledToFill()
                        }).sheet(isPresented: $showDetailsNews, content: {
                            DetailsNewsView(news: news)
                        })
                        
                        
                        //Image(news.Image)
                            //.resizable()
                        

                    }
                }.frame(width: UIScreen.main.bounds.width - 30, height: 220)
                    .background(color[Int.random(in: 0..<color.count)])
                    .cornerRadius(25)
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.bottom)
                    .shadow(color: color[Int.random(in: 0..<color.count)], radius: 10, x: 0, y: 7)
            }
            
        }
    }
}

struct BlockNews_Previews: PreviewProvider {
    static var previews: some View {
        BlockNews(news: News(id: 0, title: "Test", date: "5 Декабря", image: "https://sun9-24.userapi.com/impg/U7gi4btz5EawvnJmWPYIrGLLs0lnxtri32oACQ/2SdMlO7KrbQ.jpg?size=1080x1080&quality=95&sign=e4d0bbb163a64e8ea3a82b802aa6321f&type=album", text: "TEXT"))
    }
}
