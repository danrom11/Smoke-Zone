//
//  HookahTableView.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 12.08.2022.
//

import SwiftUI



//let coloredNavAppearance = UINavigationBarAppearance()

struct HookahTableView: View {
    
//    init() {
//        // coloredNavAppearance.configureWithOpaqueBackground()
//        coloredNavAppearance.backgroundColor = .black
//        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.systemTeal]
//        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//
//        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
//
//    }
    
    @Environment(\.presentationMode) var presentationMode
    
    
    
    @State private var OpenSelectTypeHookah = false
    
    var body: some View {
        //NavigationView{
            ZStack{
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                    ZStack{
                        HStack{
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Image(systemName: "chevron.backward")
                                    .font(.system(size: 32))
                                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                                    .padding(.leading)
                            })
                            Spacer()
                        }
                        Text("Сборка стола")
                            .font(.system(size: 32))
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                    }
                    
                    
                    ScrollView(.vertical, showsIndicators: false, content: {
                        HStack{
                            NavigationLink(destination: HookahTypeView(), label: {
                                Image(systemName: "plus.circle")
                                    .font(.system(size: 40, weight: .light))
                                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.cyan, .indigo]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            }).isDetailLink(false)
                            
                            
                        }
                        .padding()
                    })
                    
                    
                    
                    
                    Spacer()
                }
                
               // .navigationBarHidden(true)
            }.edgesIgnoringSafeArea(.bottom)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .navigationViewStyle(StackNavigationViewStyle())
        }
        
    }
    
//}


struct HookahTableView_Previews: PreviewProvider {
    static var previews: some View {
        HookahTableView()
    }
}
