//
//  Notification.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 08.07.2022.
//

import SwiftUI

struct NotificationHUD: View {
    
    var textNotification : String
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text(textNotification)
                        .foregroundColor(.white)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(35)
                        .shadow(color: .teal, radius: 5, x: 0, y: 4)
                }.padding(.top)
               
                Spacer()
            }
        }
    }
}

struct Notification_Previews: PreviewProvider {
    static var previews: some View {
        NotificationHUD(textNotification: "Test Message")
    }
}
