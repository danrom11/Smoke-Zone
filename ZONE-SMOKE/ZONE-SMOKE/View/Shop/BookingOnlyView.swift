//
//  BookingOnlyView.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 04.09.2022.
//

import SwiftUI

struct BookingOnlyView: View {
    
    @State var showLogin : Bool = false
    @State var clickSelectedTable : Bool = false
    
    @State var countPerson : Int = 1
    
    @State private var date = Date()
    
    
    @ObservedObject var connectNetwork = NetworkModel.shared
    @ObservedObject var connectBooking = BookingModel.shared
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.top)
            
            
            VStack{
                if(connectNetwork.userProfile.id != -1){
                    
                    
                    HStack{
                        Text("Выбор места")
                            .font(.system(size: 32))
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            .padding(.leading)
                        Spacer()
                    }
                    
                    if(connectNetwork.loadBookings){
                        VStack{
                            Spacer()
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .scaleEffect(2)
                            Spacer()
                        }
                        
                    } else {
                        VStack{
                            HStack{
                                Text("Вермя:")
                                    .font(.system(size: 23))
                                DatePicker("Время", selection: $date, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                                    .onChange(of: date, perform: { value in
                                        connectNetwork.getTabelBookings(date: value)
                                    })
                                    .environment(\.locale, Locale.init(identifier: "ru"))
                                    .labelsHidden()
                                    .preferredColorScheme(.dark)
                                    .foregroundColor(.white)
                                    //.tint(.white)
                            }.padding(.leading)
                            
                            
                            
                            //Spacer()
                            
                            
                            HStack{
                                Spacer()
                                TableBooking(booking: connectBooking.tables[9], clickSelectedTable: $clickSelectedTable)
                            }.padding([.top, .trailing])
                            
                            HStack{
                                Spacer()
                                TableBooking(booking: connectBooking.tables[8], clickSelectedTable: $clickSelectedTable)
                            }.padding([.top, .trailing])
                                .padding(.bottom, 35)
                            
                            HStack{
                                Spacer()
                                
                                TableBooking(booking: connectBooking.tables[7], clickSelectedTable: $clickSelectedTable)
                                    .padding(.trailing)
                                
                                TableBooking(booking: connectBooking.tables[5], clickSelectedTable: $clickSelectedTable)
                                    .padding(.trailing)
                                
                                TableBooking(booking: connectBooking.tables[2], clickSelectedTable: $clickSelectedTable)
                            }.padding([.top, .trailing])
                                .padding(.bottom)
                            
                            HStack{
                                Spacer()
                                
                                TableBooking(booking: connectBooking.tables[6], clickSelectedTable: $clickSelectedTable)
                                    .padding(.trailing)
                                
                                TableBooking(booking: connectBooking.tables[4], clickSelectedTable: $clickSelectedTable)
                                    .padding(.trailing)
                                
                                TableBooking(booking: connectBooking.tables[1], clickSelectedTable: $clickSelectedTable)
                            }.padding([.top, .trailing])
                                .padding(.bottom)
                            
                            HStack{
                                Spacer()
                                
                                TableBooking(booking: connectBooking.tables[3], clickSelectedTable: $clickSelectedTable)
                                    .padding(.trailing)
                                
                                TableBooking(booking: connectBooking.tables[0], clickSelectedTable: $clickSelectedTable)
                            }.padding([.top, .trailing])
                                .padding(.bottom, 40)
                            
                            
                            Spacer()
                        }.padding(.trailing, 50)
                    }
                    
                } else {
                    Text("Для бронирование требуется войти в аккаунт!")
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
                
            }
        }.edgesIgnoringSafeArea(.bottom)
            .popup(isPresented: $clickSelectedTable, type: .floater(verticalPadding: 0, useSafeAreaInset: true), position: .top, animation: .spring(), dragToDismiss: true, closeOnTap: false, dismissCallback: {
                connectBooking.selectedTable = Booking(id: -1, booking: false)
            }, view: {
                ZStack{
                    VStack{
                        
                        HStack{
                            Color.white
                        }
                        .frame(width: 25, height: 5)
                        .cornerRadius(35)
                        .padding(.top)
                        
                        HStack{
                            Text("Стол №\(connectBooking.selectedTable.id)")
                                .foregroundColor(.white)
                                .font(.system(size: 25))
                        }
                        
                        HStack{
                            Text("Бронь на: \(date.formatted())")
                                .foregroundColor(.white)
                                .font(.system(size: 25))
                            Spacer()
                        }
                        .padding(.leading)
                        .padding(.top, 5)
                        
                        HStack{
                            Text("Чел.: \(countPerson)")
                                .foregroundColor(.white)
                                .font(.system(size: 25))
                            
                            Button(action: {
                                countPerson += 1
                            }, label: {
                                Image(systemName: "plus.circle")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                            })
                            
                            Button(action: {
                                if(countPerson != 1){
                                    countPerson -= 1
                                }
                            }, label: {
                                Image(systemName: "minus.circle")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                            }).disabled(countPerson == 1 ? true : false)
                            
                            Spacer()
                        }.padding(.leading)
                            .padding(.top, 5)
                        
                        
                        
                        Spacer()
                        
                        
                        Button(action: {
                            
                            connectNetwork.sendOrder(order: [Hookah(id: -1, title: "null", bowl: ElementHookah(id: -1, price: 0, image: "null", text: "null", typeObject: "null"), flask: ElementHookah(id: -1, price: 0, image: "null", text: "null", typeObject: "null"), tobacco: [Product](arrayLiteral: Product(id: -1, title: "null", imageUrl: "null", price: 0, descript: "null", brand: "null", taste: ["null"], strong: 0, count: 0)))], food: [Product(id: -1, title: "null", imageUrl: "null", price: 0, descript: "null", brand: "null", taste: ["null"], strong: 0, count: 0)], user: connectNetwork.userProfile, date: date, table: connectBooking.selectedTable.id)
                            
//                            connectNetwork.sendOrder(order: HookahAssembly(id: -1, title: "null", hookah: [Hookah](arrayLiteral: Hookah(id: -1, title: "null", bowl: ElementHookah(id: -1, price: 0, image: "null", text: "null", typeObject: "null"), flask: ElementHookah(id: -1, price: 0, image: "null", text: "null", typeObject: "null"), tobacco: [Product](arrayLiteral: Product(id: -1, title: "null", imageUrl: "null", price: 0, descript: "null", brand: "null", taste: ["null"], strong: 0, count: 0))))), food: [Product(id: 76, title: "Салат цезарь", imageUrl: "salat", price: 300, descript: "Мой родной салатик", brand: "Салаты", taste: ["Курица", "Сыр", "Салат", "Чери", "Гренки"], strong: 300, count: 1)], user: connectNetwork.userProfile, date: date, table: connectBooking.selectedTable.id)
                            clickSelectedTable = false
                            countPerson = 1

                        }, label: {
                            Text("Забронировать")
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing))
                                .font(.system(size: 20))
                                .padding()
                                .background(.white)
                                .cornerRadius(35)
                        }).padding(.bottom)
                        
                        
                        
                    }
                }.frame(width: UIScreen.main.bounds.width, height: 240)
                    .background(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                    .cornerRadius(35)
            })
            .navigationBarHidden(true)
            .onAppear{
                connectNetwork.getTabelBookings(date: date)
            }
            
    }
}

struct BookingOnlyView_Previews: PreviewProvider {
    static var previews: some View {
        BookingOnlyView()
    }
}
