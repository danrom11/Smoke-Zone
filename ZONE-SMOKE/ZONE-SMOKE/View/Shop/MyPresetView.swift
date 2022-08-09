//
//  MyPresetView.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 10.06.2022.
//

import SwiftUI

struct MyPresetView: View {
    
    @State private var showHookahView = false
    
    var body: some View {
        ZStack{
            Color.black
            VStack{
                HStack{
                    Text("Готовые сборки")
                        .font(.system(size: 32))
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                        .padding(.top, 40)
                        .padding(.leading)
                    Spacer()
                }
                
                //TODO::LIST Preset
                
                HStack{
                    Button(action: {
                        self.showHookahView.toggle()
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 40, weight: .light))
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.cyan, .indigo]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    })
                    
                }
                .fullScreenCover(isPresented: $showHookahView){
                    HookahView()
                }
                .padding()
                
                Spacer()
            }
        }.ignoresSafeArea(.all)
    }
}

struct MyPresetView_Previews: PreviewProvider {
    static var previews: some View {
        MyPresetView()
    }
}
