//
//  HookahViewTWO.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 09.05.2022.
//

import SwiftUI

struct HookahView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var sh = CatalogViewModel.shared
    @State private var showTabacco = false
    
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.top)
            VStack{
                
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
                    
                    Text("Табак")
                        .font(.system(size: 32))
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                        //.padding(.top, 40)
                        .padding(.leading)
                    Spacer()
                }
        
                List{
                    ForEach(CatalogViewModel.shared.cartTabacco){item in
                        ProductTobaccoCart(product: item)
                            .listRowSeparator(.hidden)
                            .swipeActions(content: {
                                Button(action: {
                                    // print(item.id)
                                    print(sh.serchIndex(product: item, array: sh.productsTabacco))
                                    sh.cartTabacco.remove(at: sh.serchIndex(product: item, array: sh.productsTabacco))
                                    
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
            
            if(sh.cartTabacco.count > 0){
                ButtonNext()
                    .padding(.bottom, 10)
            }

        }.edgesIgnoringSafeArea(.bottom)
        
        
        
        
    }
}

struct HookahViewTWO_Previews: PreviewProvider {
    static var previews: some View {
        HookahView()
        
    }
}

struct ButtonNext : View{
    @State private var showEat = false
    var body: some View{
        ZStack{
            VStack{
                Spacer()
                HStack{
                    Button(action: {
                        self.showEat.toggle()
                    }, label: {
                        Text("Дальше")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                    }).fullScreenCover(isPresented: $showEat){
                        FoodView()
                    }
                }
                .frame(width: 180, height: 80)
                .background(LinearGradient(gradient: Gradient(colors: [.indigo, .teal]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(35)
                .padding()
            }
        }
    }
}
