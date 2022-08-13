//
//  MyPresetView.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 10.06.2022.
//

import SwiftUI

struct MyPresetView: View {

    
    var body: some View {
        NavigationView{
            ZStack{
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    ZStack{
                        HStack{
                            Text("Готовые сборки")
                                .font(.system(size: 32))
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                                .padding(.leading)
                            Spacer()
                        }
                    }
                    
                    
                    //TODO::LIST Preset
                    
                    HStack{
                        NavigationLink(destination: HookahTableView(), label: {
                            Image(systemName: "plus.circle")
                                .font(.system(size: 40, weight: .light))
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.cyan, .indigo]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        }).isDetailLink(false)
                        
                    }
                    .padding()
                    
                    Spacer()
                }
            }.edgesIgnoringSafeArea(.bottom)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .navigationViewStyle(StackNavigationViewStyle())
        }
       
    }
}

struct MyPresetView_Previews: PreviewProvider {
    static var previews: some View {
        MyPresetView()
    }
}
