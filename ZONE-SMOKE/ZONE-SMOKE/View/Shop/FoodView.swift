//
//  FoodView.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 24.05.2022.
//

import SwiftUI

struct FoodView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var activeRootLink : Bool
    
    @ObservedObject var sh = CatalogViewModel.shared
    @State private var showFoods = false

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
                           // .padding(.top, 40)
                            .padding(.leading)
                    })
                    
                    Text("Еда")
                        .font(.system(size: 32))
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                        //.padding(.top, 40)
                        .padding(.leading)
                    Spacer()
                    
                    if(sh.priceFood() > 0){
                        Text("Стоимость \(sh.priceFood().formatted()) ₽")
                            .font(.system(size: 15))
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                           // .padding(.top, 40)
                            .padding(.trailing)
                    }
                }
                ScrollView(.vertical, showsIndicators: false, content: {
                    
                    ForEach(CatalogViewModel.shared.cartFood){item in
                        ProductFoodCart(product: item)
                    }
                    HStack(){
                        //Spacer()
                        Button(action: {
                            self.showFoods.toggle()
                        }, label: {
                            Image(systemName: "plus.circle")
                                .font(.system(size: 40, weight: .light))
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.cyan, .indigo]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        }).fullScreenCover(isPresented: $showFoods){
                            SelectionFoodView()
                        }
                        
                       // Spacer()
                    }
                    
                    HStack{
                    }
                    .frame(height: 200)
                    
                })
                    
                Spacer()
                
            }
            
            
            
            ZStack{
                VStack{
                    Spacer()
                    HStack{
                        NavigationLink(destination: {BuyView(activeRootLink: $activeRootLink)}, label: {
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
            //ButtonNextBuy()
                //.padding(.bottom, 10)

        }.edgesIgnoringSafeArea(.bottom)
            .navigationBarHidden(true)
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(activeRootLink: .constant(false))
    }
}

//struct ButtonNextBuy : View{
//    @State private var showBuy = false
//    var body: some View{
//        ZStack{
//            VStack{
//                Spacer()
//                HStack{
//                    Button(action: {
//                        self.showBuy.toggle()
//                    }, label: {
//                        Text("Дальше")
//                            .foregroundColor(.white)
//                            .font(.system(size: 30))
//                    }).fullScreenCover(isPresented: $showBuy){
//                       // FoodView()
//                        //BuyView(activeRootLink: $activeRootLink)
//                    }
//                }
//                .frame(width: 180, height: 80)
//                .background(LinearGradient(gradient: Gradient(colors: [.indigo, .teal]), startPoint: .leading, endPoint: .trailing))
//                .cornerRadius(35)
//                .padding()
//            }
//        }
//    }
//}

