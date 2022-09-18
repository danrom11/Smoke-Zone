//
//  BuyView.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 20.06.2022.
//

import SwiftUI

struct BuyView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var activeRootLink : Bool
    
    @ObservedObject var sh = CatalogViewModel.shared
    @ObservedObject var connectHookah = HookahAssemblyModel.shared
    
    @State private var date = Date()
    
    @State private var showLogin = false
    
    @State private var bonusCheck = false
    @State private var selectedBonus : Double = 0
    
    @ObservedObject var connectUser = NetworkModel.shared
    
    
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.top)
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
                        Text("Оформление")
                            .font(.system(size: 32))
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            //.padding(.leading)
                    }
                }
                if(connectUser.userProfile.id != -1){
                    HStack{
                        Text(bonusCheck ? "Ваш заказ на \((sh.priceFood() + connectHookah.getPriceHookahs() - Decimal(selectedBonus)).formatted()) ₽ : " : "Ваш заказ на \((sh.priceFood() + connectHookah.getPriceHookahs()).formatted()) ₽ :")
                            .font(.system(size: 25))
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    if(bonusCheck){
                        HStack{
                            Text("Цена с использованием бонусов")
                                .font(.system(size: 15))
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                                .padding(.leading)
                            Spacer()
                        }
                        
                    }
                    
                    
                    HStack{
                        ScrollView(.vertical){
                            VStack(alignment: .leading){
                                ForEach(connectHookah.hookahs){item in
                                    Text("Кальян \(item.title) - \((item.bowl.price + item.flask.price).formatted()) ₽")
                                        .font(.system(size: 20))
                                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                                        .padding(.bottom, 5)
                                }
                                
                                ForEach(CatalogViewModel.shared.cartFood){item in
                                    Text("\(item.title) кол. \(item.count) - \((item.price * Decimal(item.count)).formatted()) ₽")
                                        .font(.system(size: 20))
                                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                                        .padding(.bottom, 5)
                                }
                            }
                        }.frame(maxHeight: 250)
                     Spacer()
                    }.padding(.leading)
                    if(connectUser.userProfile.bonus > 0){
                        VStack{
                            Toggle(isOn: $bonusCheck, label: {Text("Использовать бонусы")})
                                .foregroundColor(.white)
                            if(bonusCheck == true){
                                //Slider(value: $selectedBonus, in: 0...Double(connectUser.userProfile.bonus), step: 1.0)
                                //Slider(value: $selectedBonus, in: 0...((15 > 5) ? Double(100) : Double(50)), step: 1.0)
                                Slider(value: $selectedBonus, in: 0...((connectUser.userProfile.bonus >= ((sh.priceFood() as NSDecimalNumber).intValue + 550)) ? Double((sh.priceFood() as NSDecimalNumber).intValue + 550) : Double(connectUser.userProfile.bonus)), step: 1.0)
                                    .accentColor(.white)
                                Text("Бонусов: \(Int(selectedBonus))")
                                    .foregroundColor(.white)
                            }
                        }
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(35)
                    }
                    
                    
                    
                    Text("Забронировать на:")
                        .font(.system(size: 25))
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                    DatePicker("Время", selection: $date, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                        .environment(\.locale, Locale.init(identifier: "ru"))
                        .labelsHidden()
                        //.datePickerStyle(.wheel)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(35)
                        .foregroundColor(.white)
                        .tint(.white)
                        //.id(date)
                    HStack{
                        
                        NavigationLink(destination: {BookingView(activeRootLink: $activeRootLink, date: date)}, label: {
                            Text("Готово")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                        }).isDetailLink(false)
                        
                    }
                    .frame(width: 180, height: 80)
                    .background(LinearGradient(gradient: Gradient(colors: [.indigo, .teal]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(35)
                    .padding()
                } else {
                    Text("Для оформления заказа требуется войти в аккаунт!")
                        .font(.system(size: 25))
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                        .padding()
                    Spacer()
                    HStack{
                        
                        
                        
                        Button(action: {
                            self.showLogin.toggle()
                        }, label: {
                            Text("Войти")
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .trailing))
                                .font(.system(size: 30))
                                .padding(20)
                                .overlay(RoundedRectangle(cornerRadius: 30).stroke(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing), lineWidth: 3))
                        }).fullScreenCover(isPresented: $showLogin){
                            ProfileLoginView()
                        }
                    }
                   Spacer()
                    
                }
                
                    
                
                Spacer()
            }
        }.edgesIgnoringSafeArea(.bottom)
            .navigationBarHidden(true)
    }
}

struct BuyView_Previews: PreviewProvider {
    static var previews: some View {
        BuyView(activeRootLink: .constant(false))
    }
}
