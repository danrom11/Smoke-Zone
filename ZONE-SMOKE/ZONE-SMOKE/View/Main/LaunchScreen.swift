//
//  LaunchScreen.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 22.04.2022.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    @State private var CheckMail = UserDefaults.standard.string(forKey: "userMail")
    
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            if(isActive == true){
                BottomTabView()
            }else{
                VStack{
                    VStack{
                        Image("SplashIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear(){
                        withAnimation(.easeIn(duration: 1.2)){
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear(){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                        self.isActive = true
                    }
                }
            }
        }.onAppear(){
            NetworkModel.shared.getInfoUser(mail: CheckMail ?? "null")
            NetworkModel.shared.getProductTabacco()
            NetworkModel.shared.getProductFood()
        }
        
        
        
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}


