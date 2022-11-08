//
//  MyPresetView.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 10.06.2022.
//

import SwiftUI

struct MyPresetView: View {

    @ObservedObject private var connectHookah = HookahAssemblyModel.shared
    
    
    @State private var presetRootLink = false
    
    var body: some View {
       // NavigationView{
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
                    ScrollView(.vertical, showsIndicators: true, content: {
                        
                        if(connectHookah.myHookahAssembly.count > 0){
                            HStack{
                                Text("Мои сборки")
                                    .font(.system(size: 28))
                                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                                    .padding(.leading)
                                
                                Image(systemName: "heart.fill")
                                    .font(.system(size: 28))
                                    .foregroundColor(.red)
                                
                                Spacer()
                            }
                            
                            ForEach(connectHookah.myHookahAssembly) {item in
                                HookahAssemblyButton(hookahAssembly: item, openHookahAssembly: $presetRootLink)
                                    .padding(.top, 5)
                            }
                        }
                        
                        
                        
                        HStack{
                            NavigationLink(isActive: $presetRootLink, destination: { HookahTableView(presetRootLink: $presetRootLink) }, label: {
                                Image(systemName: "plus.circle")
                                    .font(.system(size: 40, weight: .light))
                                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.cyan, .indigo]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            }).isDetailLink(false).simultaneousGesture(TapGesture().onEnded({
                                connectHookah.hookahs.removeAll()
                            }))
                            
                        }
                        .padding()
                        .padding(.bottom, 90)
                    })
                    
                    
                    
                    Spacer()
                }
            }.edgesIgnoringSafeArea(.bottom)
                .navigationBarHidden(true)
//                .navigationBarBackButtonHidden(true)
//                .navigationViewStyle(StackNavigationViewStyle())
        }
       
    //}
}

struct MyPresetView_Previews: PreviewProvider {
    static var previews: some View {
        MyPresetView()
    }
}
