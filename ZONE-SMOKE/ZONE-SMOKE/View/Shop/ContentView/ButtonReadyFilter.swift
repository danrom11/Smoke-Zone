//
//  ButtonReady.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 17.06.2022.
//

import SwiftUI

struct ButtonReadyFilter : View{
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        ZStack{
            VStack{
                Spacer()
                HStack{
                    Button(action: {
                        print("dismiss filter")
                        FilterModel.shared.userFilters.removeAll()
                        self.presentationMode.wrappedValue.dismiss()
                        
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
struct ButtonReady_Previews: PreviewProvider {
    static var previews: some View {
        ButtonReadyFilter()
    }
}
