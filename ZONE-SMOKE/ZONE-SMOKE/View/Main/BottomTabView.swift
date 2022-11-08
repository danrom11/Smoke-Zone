//
//  BottomTAB.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 21.04.2022.
//

import SwiftUI

struct BottomTabView: View {
    @State var tabSelected = 0
    var body: some View {
        NavigationView{
            ZStack{
                Color.black
                TabView(selection: self.$tabSelected){
                    HomeView().tag(0)
                    MyPresetView().tag(1)
                    MusicView().tag(2)
                    BookingOnlyView().tag(3)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                
                
                
    //            switch tabSelected {
    //                case 0: HomeView()
    //                case 1: MyPresetView() //HookahView()
    //                case 2: MusicView()
    //            default:
    //                HomeView()
    //            }
           
                
                VStack{
                    Spacer()
                    HStack{
                        VStack(alignment: .center){
                            Button(action: {self.tabSelected = 0}, label: {
                                Image(systemName: "house")
                                    .foregroundColor(self.tabSelected == 0 ? .mint : .white)
                                    .font(.system(size: 20))
                                
                            })
                            Text("Главная")
                                .foregroundColor(self.tabSelected == 0 ? .mint : .white)
                                .minimumScaleFactor(0.7)
                                //.font(.system(size: 12))
                        }.frame(width: 50, height: 50)
                        
                        Spacer()
                        VStack(alignment: .center){
                            Button(action: {self.tabSelected = 1}, label: {
                                Image(systemName: "smoke")
                                    .foregroundColor(self.tabSelected == 1 ? .mint : .white)
                                    .font(.system(size: 20))
                            })
                            Text("Заказ")
                                .foregroundColor(self.tabSelected == 1 ? .mint : .white)
                               //.font(.system(size: 20))
                                .minimumScaleFactor(0.7)
                        }.frame(width: 50, height: 50)
                        Spacer()
                        VStack(alignment: .center){
                            Button(action: {self.tabSelected = 2}, label: {
                                Image(systemName: "music.mic.circle")
                                    .foregroundColor(self.tabSelected == 2 ? .mint : .white)
                                    .font(.system(size: 20))
                            })
                            Text("Музыка")
                                .foregroundColor(self.tabSelected == 2 ? .mint : .white)
                                .minimumScaleFactor(0.7)
                        }.frame(width: 50, height: 50)
                        Spacer()
                        VStack(alignment: .center){
                            Button(action: {self.tabSelected = 3}, label: {
                                Image(systemName: "calendar.badge.plus")
                                    .foregroundColor(self.tabSelected == 3 ? .mint : .white)
                                    .font(.system(size: 20))
                            })
                            Text("Бронь")
                                .foregroundColor(self.tabSelected == 3 ? .mint : .white)
                                .minimumScaleFactor(0.6)
                        }.frame(width: 50, height: 50)

                        
                    }
                    .padding(.horizontal)
                    .padding()
                    .padding(.bottom, 15)
                    .shadow(color: .green.opacity(4), radius: 10, x: 0, y: 1)
                    .background(LinearGradient(gradient: Gradient(colors: [.indigo, .cyan]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    
                    .cornerRadius(35, corners: [.topLeft, .topRight])
                    
                    
                }
                .shadow(color: .mint.opacity(4), radius: 10, x: 0, y: -7)
                
            }.edgesIgnoringSafeArea(.all)
                .navigationBarHidden(true)
        }
        
        
            
            
        
        
    }
}

struct BottomTabMainModuleView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView()
    }
}





