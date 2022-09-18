//
//  TableBooking.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 30.08.2022.
//

import SwiftUI
import PopupView

struct TableBooking: View {
    
    var booking : Booking
    
    @ObservedObject var connectBooking = BookingModel.shared
    
    @State var clickAlert : Bool = false
    
    @Binding var clickSelectedTable : Bool
    
    var body: some View {
        ZStack{
            
            Button(action: {
                if(booking.booking == true){
                    clickAlert = true
                }else{
                    connectBooking.selectedTable = Booking(id: -1, booking: false)
                    connectBooking.selectedTable = booking
                    clickSelectedTable = true
                }
                
            }, label: {
                HStack{
                    Text(booking.id.formatted())
                        .font(.system(size: 30))
                        .foregroundStyle(booking.booking == true ||   connectBooking.selectedTable.id == booking.id ? LinearGradient(gradient: Gradient(colors: [.white]), startPoint: .leading, endPoint: .trailing) : LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing))
                    
                }
                .frame(width: 70, height: 70)
                
                .background(booking.booking == true || connectBooking.selectedTable.id == booking.id ? LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .topLeading, endPoint: .bottomTrailing) : LinearGradient(gradient: Gradient(colors: [.clear]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(10)
                
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 7))
                .shadow(color: connectBooking.selectedTable.id == booking.id ? .teal : .clear, radius: 5, x: 0, y: 0)
                
            }).alert(isPresented: $clickAlert){
                Alert(title: Text("Стол забронирован"), message: Text("Данный стол уже забронирован на это время"), dismissButton: .cancel(Text("Хорошо")))
            }
            
            

        }
    }
}

struct TableBooking_Previews: PreviewProvider {
    static var previews: some View {
        TableBooking(booking: Booking(id: 1, booking: false), clickSelectedTable: .constant(false))
    }
}
