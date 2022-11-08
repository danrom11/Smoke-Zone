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
    
    @State private var CheckProfile = UserDefaults.standard.string(forKey: "userProfile")
    
    
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            if(isActive == true){
                BottomTabView()
            }else{
                VStack{
                    Spacer()
                    
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
                    
                    Spacer()
                    
                    Text("МИНЗДРАВСОЦРАЗВИТИЯ ПРЕДУПРЕЖДАЕТ:\nКУРЕНИЕ ВРЕДИТ ВАШЕМУ ЗДОРОВЬЮ.\nПРИЛОЖЕНИЕ ПРЕДНАЗНАЧЕНО ДЛЯ ЛИЦ СТАРШЕ 18 ЛЕТ")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                        .padding()
                }
                .onAppear(){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                        self.isActive = true
                    }
                }
            }
        }.onAppear(){
            NetworkModel.shared.getInfoUser(phone: CheckProfile ?? "null")
            NetworkModel.shared.loadUserAvatar()
            HookahAssemblyModel.shared.loadMyHookahAssembly()
            
            NetworkModel.shared.getNews()
            NetworkModel.shared.getPopulars()
            
            NetworkModel.shared.getFiltersTabacco()
            NetworkModel.shared.getProductTabacco()
            
            NetworkModel.shared.getFiltersFood()
            NetworkModel.shared.getProductFood()
        }
        
        
        
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}


