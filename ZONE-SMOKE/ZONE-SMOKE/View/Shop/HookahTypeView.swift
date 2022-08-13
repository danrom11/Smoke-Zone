//
//  HookahTypeView.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 12.08.2022.
//

import SwiftUI



struct HookahTypeView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var connectElementsHookah = HookahAssemblyModel.shared
    
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
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
                        Text("Сборка")
                            .font(.system(size: 32))
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                    }
                }
                
                VStack{
                    HStack{
                        Text("Чаша:")
                            .font(.system(size: 30))
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            .padding([.leading, .top])
                        Spacer()
                    }
                    
                    ScrollView(.horizontal, showsIndicators: true, content: {
                        HStack{
                            ForEach(connectElementsHookah.bowls){item in
                                CardElementHookahBowl(elementHookah: item)
                                    .padding()
                            }
                        }
                        
                    }).preferredColorScheme(.dark)
                    
                    HStack{
                        Text("Колба:")
                            .font(.system(size: 30))
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            .padding([.leading, .top])
                        Spacer()
                    }
                    
                    ScrollView(.horizontal, showsIndicators: true, content: {
                        HStack{
                            ForEach(connectElementsHookah.flasks){item in
                                CardElementHookahFlask(elementHookah: item)
                                    .padding()
                            }
                        }
                        
                    }).preferredColorScheme(.dark)
                    
                }
                
                
                Spacer()
                
                if(connectElementsHookah.selectedBowl.id != -1 && connectElementsHookah.selectedFlask.id != -1){
                    HStack{
                        NavigationLink(destination: HookahView(), label: {
                            Text("Дальше")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                        }).isDetailLink(false)
                    }
                    .frame(width: 180, height: 80)
                    .background(LinearGradient(gradient: Gradient(colors: [.indigo, .teal]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(35)
                    .padding()
                }
                
            }
            
         
        }.edgesIgnoringSafeArea(.bottom)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HookahTypeView_Previews: PreviewProvider {
    static var previews: some View {
        HookahTypeView()
    }
}
