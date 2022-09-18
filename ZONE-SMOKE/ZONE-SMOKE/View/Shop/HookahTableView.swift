//
//  HookahTableView.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 12.08.2022.
//

import SwiftUI
import PopupView

struct HookahTableView: View {
    
    @ObservedObject var sh = CatalogViewModel.shared
    @ObservedObject var connectHookah = HookahAssemblyModel.shared
    
    @Binding var presetRootLink : Bool
    
    @State private var activateRootLink = false
    @State private var IDReadyHookah = -1
    
    
    @State private var readyButton = false
    @State private var nameHookahTable = ""
    @State private var showHUDError = false
    
    @State private var saveHookahTable = false
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
    
    @State private var OpenSelectTypeHookah = false
    
    var body: some View {
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
                    
                    ForEach(connectHookah.hookahs){item in
                        HookahButton(hookah: item, activateRootLink: $activateRootLink, IDReadyHookah: $IDReadyHookah)
                            .padding(.top, 15)
                    }
                    
                    HStack{
                        NavigationLink(isActive: $activateRootLink, destination: { HookahTypeView(activateRootLink: $activateRootLink, IDReadyHookah: $IDReadyHookah) }, label: {
                            Image(systemName: "plus.circle")
                                .font(.system(size: 40, weight: .light))
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.cyan, .indigo]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        }).isDetailLink(false)
                        
                        
                    }
                    .padding()
                    
                    
                })
                
                
                
                
                
                Spacer()
            }
            .onAppear(){
                IDReadyHookah = -1
                sh.cartTabacco = [Product]()
                connectHookah.selectedBowl = ElementHookah(id: -1, price: 0, image: "null", text: "null", typeObject: "null")
                connectHookah.selectedFlask = ElementHookah(id: -1, price: 0, image: "null", text: "null", typeObject: "null")
            }
            
            if(connectHookah.hookahs.count > 0 && readyButton == false){
                ZStack{
                    VStack{
                        Spacer()
                        HStack{
                            Button(action: {
                                readyButton = true
                            }, label: {
                                Text("Собрать")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30))
                            })
                            
                        }
                        .frame(width: 180, height: 80)
                        .background(LinearGradient(gradient: Gradient(colors: [.indigo, .teal]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(35)
                        .padding()
                    }
                    
                }
            }
            
        }.edgesIgnoringSafeArea(.bottom)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
        
            .popup(isPresented: $readyButton, type: .floater(verticalPadding: 0, useSafeAreaInset: true), closeOnTap: false){
                ZStack{
                    HStack{
                        VStack(alignment: .leading, spacing: 3){
                            Spacer()
                            HStack{
                                Text("Сохранить:")
                                    .foregroundColor(.white)
                                    .font(.system(size: saveHookahTable == false ? 30 : 15))
                                Button(action: {
                                    saveHookahTable.toggle()
                                }, label: {
                                    Image(systemName: saveHookahTable == false ? "heart" : "heart.fill")
                                        .font(.system(size: saveHookahTable == false ? 30 : 15))
                                        .foregroundColor(.red)
                                })
                            }
                            
                            
                            if(saveHookahTable == true){
                                Text("Название:")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                                TextField("", text: $nameHookahTable)
                                    .placeholder(when: nameHookahTable.isEmpty, placeholder: {
                                        Text("Название сборки")
                                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.indigo, .teal]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                    })
                                    .frame(width: 200, height: 40)
                                    .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                    .foregroundColor(.black)
                                    .background(Color.white)
                                    .cornerRadius(15)
                            }
                            
                            
                            
                            Spacer()
                        }
                        Spacer()
                        VStack{
                            Spacer()
                            
                            NavigationLink(destination: {
                                FoodView(activeRootLink: $presetRootLink)
                                
                            }){
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(.white)
                                    .font(.system(size: 50))
                                    .padding()
                                
                            }
                            .isDetailLink(false)
                            .simultaneousGesture(TapGesture().onEnded({
                                
                                
                                
                                sh.hookahAssembly = HookahAssembly(id: connectHookah.myHookahAssembly.count, title: saveHookahTable == true ? nameHookahTable.count > 0 ? nameHookahTable : "Моя сборка \(connectHookah.myHookahAssembly.count + 1)" : "Быстрый заказ", hookah: connectHookah.hookahs)
                                
                                if(saveHookahTable == true){
                                    connectHookah.myHookahAssembly.append(HookahAssembly(id: connectHookah.myHookahAssembly.count, title: nameHookahTable.count > 0 ? nameHookahTable : "Моя сборка \(connectHookah.myHookahAssembly.count + 1)", hookah: connectHookah.hookahs))
                                    UserDefaults.standard.set(try? PropertyListEncoder().encode(connectHookah.myHookahAssembly), forKey: "myHookahAssembly")
                                }
                                
                                nameHookahTable = ""
                                saveHookahTable = false
                            }))
                            Spacer()
                        }
                    }.padding()
                }
                .frame(width: UIScreen.main.bounds.width, height: 120)
                .background(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                .cornerRadius(35)
            }.popup(isPresented: $showHUDError, type: .default, position: .top, autohideIn: 2.0, dragToDismiss: true){
                ZStack{
                    VStack{
                        HStack{
                            Text("Введите название")
                                .foregroundColor(.white)
                                .padding()
                                .background(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(35)
                                .shadow(color: .teal, radius: 5, x: 0, y: 4)
                        }
                        .padding(.top, 40)
                        Spacer()
                    }
                }
            }
        
    }
    
}




struct HookahTableView_Previews: PreviewProvider {
    static var previews: some View {
        HookahTableView(presetRootLink: .constant(false))
    }
}
