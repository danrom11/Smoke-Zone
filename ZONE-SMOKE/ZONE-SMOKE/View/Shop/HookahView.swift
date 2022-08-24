//
//  HookahViewTWO.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 09.05.2022.
//

import SwiftUI

import PopupView

struct HookahView: View {
    @Binding var activateRootLink : Bool
    @Binding var IDReadyHookah : Int
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var connectHookah = HookahAssemblyModel.shared
    @ObservedObject var sh = CatalogViewModel.shared
    
    @State private var showTabacco = false
    @State private var showReadyPopup = false
    
    @State private var showHUDError = false
    
    @State private var nameHookah = ""
    
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
                                    //.padding(.top, 40)
                                    .padding(.leading)
                            })
                            Spacer()
                        }
                        Text("Табак")
                            .font(.system(size: 32))
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            //.padding(.leading)
                    }
                }
        
                List{
                    ForEach(sh.cartTabacco){item in
                        ProductTobaccoCart(product: item)
                            .listRowSeparator(.hidden)
                            .swipeActions(content: {
                                Button(action: {
                                    
                                    sh.cartTabacco.remove(at: sh.serchIndex(product: item, array: sh.cartTabacco))
                                    
                                }, label: {
                                    Label("Delete", systemImage: "trash.circle.fill")
                                }).tint(.teal)
                            })
                            .listRowBackground(Color.clear)
                    }
                    HStack(){
                        Spacer()
                        Button(action: {
                            self.showTabacco.toggle()
                        }, label: {
                            Image(systemName: "plus.circle")
                                .font(.system(size: 40, weight: .light))
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.cyan, .indigo]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        }).fullScreenCover(isPresented: $showTabacco){
                            SelectionTabaccoView()
                        }
                        
                        Spacer()
                    }   .listRowBackground(Color.clear) .listRowSeparator(.hidden)
                    
                    HStack{
                    }
                    .frame(height: 100)
                    .listRowBackground(Color.clear) .listRowSeparator(.hidden)
                    
                }.listStyle(.plain)//.padding(.top, 40)
                
            }
            
            if(sh.cartTabacco.count > 0 && showReadyPopup == false){
                ButtonNext(showReadyPopup: $showReadyPopup)
                    .padding(.bottom, 10)
            }
            
              
                
        }.edgesIgnoringSafeArea(.bottom)
            .navigationBarHidden(true)
            
            .popup(isPresented: $showReadyPopup, type: .floater(verticalPadding: 0, useSafeAreaInset: true), closeOnTap: false){
                ZStack{
                    HStack{
                        VStack(alignment: .leading, spacing: 5){
                            Text("Название:")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                            TextField("", text: $nameHookah)
                                .placeholder(when: nameHookah.isEmpty, placeholder: {
                                    Text("Название кальяна")
                                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.indigo, .teal]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                })
                                .frame(width: 200, height: 40)
                                .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                .foregroundColor(.black)
                                .background(Color.white)
                                .cornerRadius(15)
                                //.multilineTextAlignment(.center)
                            
                            Spacer()
                        }
                        Spacer()
                        VStack{
                            Spacer()
                            Button(action: {
                                if(nameHookah.count > 0){
                                    if(IDReadyHookah == -1){
                                        connectHookah.hookahs.append(Hookah(id: connectHookah.hookahs.count, title: nameHookah, bowl: connectHookah.selectedBowl, flask: connectHookah.selectedFlask, tobacco: sh.cartTabacco))
                                    }else{
                                        connectHookah.hookahs[IDReadyHookah].title = nameHookah
                                        connectHookah.hookahs[IDReadyHookah].bowl = connectHookah.selectedBowl
                                        connectHookah.hookahs[IDReadyHookah].flask = connectHookah.selectedFlask
                                        connectHookah.hookahs[IDReadyHookah].tobacco = sh.cartTabacco
                                    }
                                    
                                    IDReadyHookah = -1
                                    activateRootLink = false
                                } else {
                                    self.showHUDError = true
                                }
                                 
                            }, label: {
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(.white)
                                    .font(.system(size: 50))
                                    .padding()
                            })
                            
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

struct HookahViewTWO_Previews: PreviewProvider {
    static var previews: some View {
        HookahView(activateRootLink: .constant(false), IDReadyHookah: .constant(-1))
    }
}

struct ButtonNext : View{
    
    @Binding var showReadyPopup : Bool
    
    @State private var showEat = false
    var body: some View{
        ZStack{
            VStack{
                Spacer()
                HStack{
                    Button(action: {
                        showReadyPopup = true
                    }, label: {
                        Text("Готово")
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
}



