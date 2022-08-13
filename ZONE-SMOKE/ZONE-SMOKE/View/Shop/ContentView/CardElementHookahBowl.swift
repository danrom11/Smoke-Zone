//
//  CardElementHookahBowl.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 12.08.2022.
//

import SwiftUI

struct CardElementHookahBowl: View {
    
    var elementHookah : ElementHookah
    
    @ObservedObject var connectElementsHookah = HookahAssemblyModel.shared
    
    var body: some View {
        
        ZStack{
            Button(action: {
                if(connectElementsHookah.selectedBowl.id == elementHookah.id){
                    connectElementsHookah.selectedBowl = ElementHookah(id: -1, image: "null", text: "null", typeObject: "null")
                } else {
                    connectElementsHookah.selectedBowl = elementHookah
                }
            }, label: {
                Image(elementHookah.image)
                
                    .resizable()
                    //.scaledToFill()
                    .cornerRadius(35)
                    .frame(width: 250, height: 150)
            })
            
           
           
            VStack{
                Spacer()
                HStack{
                    Text(elementHookah.text)
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .padding()
                    Spacer()
                }
                .background(Color.black.opacity(0.5).blur(radius: 5))
                .cornerRadius(35)
                
            }
            
            if(connectElementsHookah.selectedBowl.id == elementHookah.id){
                Button(action: {
                    if(connectElementsHookah.selectedBowl.id == elementHookah.id){
                        connectElementsHookah.selectedBowl = ElementHookah(id: -1, image: "null", text: "null", typeObject: "null")
                    } else {
                        connectElementsHookah.selectedBowl = elementHookah
                    }
                }, label: {
                    Image(systemName: "checkmark")
                        .font(.system(size: 120))
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing))
                        .shadow(color: .teal, radius: 3, x: 2, y: 5)
                })
                
            }
            
            
        }
        .frame(width: 250, height: 150)
        .shadow(color: .teal, radius: 4, x: 0, y: 1)
    }
}

struct CardElementHookahBowl_Previews: PreviewProvider {
    static var previews: some View {
        CardElementHookahBowl(elementHookah: ElementHookah(id: 0, image: "hookahStandart", text: "На чаше", typeObject: "standart"))
    }
}
