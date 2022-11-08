//
//  DetailsNewsView.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 01.10.2022.
//

import SwiftUI

struct DetailsNewsView: View {
    
    var news : News
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            
            
            ScrollView(.vertical, showsIndicators: false, content: {
                Image(systemName: "chevron.compact.down")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .padding()
                
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
                    AsyncImage(url: URL(string: news.image.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)!, placeholder: {ProgressView()}, image: { image in
                        Image(uiImage: image)
                            .resizable()
                        
                    }).scaledToFill()
                }.frame(width: UIScreen.main.bounds.width - 30, height: 220)
                    .cornerRadius(25)
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.bottom)
                
                HStack{
                    Text(news.text)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        Spacer()
                }
                
                
                Spacer()
            })
            
        }
    }
}

struct DetailsNewsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsNewsView(news: News(id: 0, title: "Привет Мир", date: "5 декабря", image: "https://sun9-24.userapi.com/impg/U7gi4btz5EawvnJmWPYIrGLLs0lnxtri32oACQ/2SdMlO7KrbQ.jpg?size=1080x1080&quality=95&sign=e4d0bbb163a64e8ea3a82b802aa6321f&type=album", text: "Здесь бует текст"))
    }
}
