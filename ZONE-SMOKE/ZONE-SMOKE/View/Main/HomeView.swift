//
//  Home.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 18.04.2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        ZStack{
           // Color.black.edgesIgnoringSafeArea(.all)
           // Image("backSmoke")
             //   .resizable()
               // //.scaledToFill()
                //.edgesIgnoringSafeArea(.all)
                //.blur(radius: 10, opaque: true)
            VStack{
                ZStack{
                    //table top menu
                    
                    // main vertical scroll
                    ScrollView(.vertical, showsIndicators: false, content: {
                        //horizontal scroll menu
                        
                        ScrollView(.horizontal, showsIndicators: true, content: {
                            HStack{
                                ForEach(HomeModel.shared.basePopular){popular in
                                    BlockPopular(popular: popular)
                                }
                            }.padding(.bottom, 10).padding(.top, 160)
                        })
                        //vertical scroll menu
                        VStack{
                            ForEach(HomeModel.shared.baseNews){news in
                                BlockNews(news: news)
                            }
                            
                            HStack{
                                Image(systemName: "bolt.horizontal")
                                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.cyan, .teal, .indigo]), startPoint: .trailing, endPoint: .leading))
                                    .font(.system(size: 45))
                            }.padding(.vertical, 60)
                            
                        }
                        
                    }).padding(.top)
                    TopTabView(selectedAvatar: 0)
                }
                    
               // Spacer()
            }
            
        }
       // .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        .background(Image("backSmoke")
            .resizable()
            .scaledToFill()
            .blur(radius: 10, opaque: true))
        .edgesIgnoringSafeArea(.all)
        //.background(Color.black)//.edgesIgnoringSafeArea(.all)
    }
}








struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
