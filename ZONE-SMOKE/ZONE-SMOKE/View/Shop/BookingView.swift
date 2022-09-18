//
//  BookingView.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 30.08.2022.
//

import SwiftUI

struct BookingView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var activeRootLink : Bool
    
    @State var clickSelectedTable : Bool = false
    
    @State var countPerson : Int = 1
    
    var date : Date
    
    @ObservedObject var connectBooking = BookingModel.shared
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.top)
            
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
                        Text("Выбор места")
                            .font(.system(size: 32))
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            .padding(.leading)
                    }
                }
                
                
                VStack{
                    Spacer()

                    
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
            
            
        }.edgesIgnoringSafeArea(.bottom)
            .popup(isPresented: $clickSelectedTable, type: .floater(verticalPadding: 0, useSafeAreaInset: true), position: .bottom, animation: .spring(), dragToDismiss: true, closeOnTap: false, dismissCallback: {
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
                            activeRootLink = false
                        }, label: {
                            Text("Забронировать")
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing))
                                .font(.system(size: 20))
                                .padding()
                                .background(.white)
                                .cornerRadius(35)
                        }).padding(.bottom)
                        
                        
                    }
                }.frame(width: UIScreen.main.bounds.width, height: 220)
                    .background(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                    .cornerRadius(35)
            })
            .navigationBarHidden(true)
            .onAppear{
                NetworkModel.shared.getTabelBookings()
            }
            
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView(activeRootLink: .constant(false), date: Date.now)
    }
}
