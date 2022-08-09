//
//  ProfileView.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 10.06.2022.
//

import SwiftUI
import Combine

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showLogin = false
    @ObservedObject var connectUser = NetworkModel.shared
    
    @State private var editUserName = false
    @State private var lastUserName = ""
    
    @State private var showHUD = false
    @State private var textNotification = ""
    
    
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea(.all)
            VStack{
                HStack{
                    Button(action: {
                        print(connectUser.userProfile)
                    }, label: {
                        Image(systemName: "person")
                            .font(.largeTitle)
                            .frame(width: 65, height: 65)
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .overlay(RoundedRectangle(cornerRadius: 35).stroke(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing), lineWidth: 2))
                    })
                    
                    Spacer()
                    Text(connectUser.userProfile.id == -1 ? "Гость" : connectUser.userProfile.userName)
                        .font(.system(size: 30))
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .trailing))
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing), lineWidth: 3))
                
                if(connectUser.userProfile.id == -1){
                    Spacer()
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
                }else{
                    HStack{
                        Text("Имя:")
                            .font(.system(size: 25))
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .trailing))
                        if(!editUserName){
                            Text(connectUser.userProfile.userName)
                                .font(.system(size: 25))
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .trailing))
                        } else {
                            TextField("Имя", text: $connectUser.userProfile.userName)
                                .onReceive(Just(connectUser.userProfile.userName)){ _ in limitText(12) }
                                .font(.system(size: 25))
                                .foregroundColor(.white)
                                .padding(5)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing), lineWidth: 3))
                        }
                        Spacer()
                        HStack{
                            Button(action: {
                                if(editUserName == true){
                                    if(connectUser.userProfile.userName.count > 0){
                                        if(lastUserName != connectUser.userProfile.userName){
                                            connectUser.SetUserName(mail: connectUser.userProfile.mail, userName: connectUser.userProfile.userName)
                                        }
                                    } else {
                                        self.textNotification = "Имя пользователя пустое"
                                        self.showHUD.toggle()
                                        dismissHUD()
                                        connectUser.userProfile.userName = lastUserName
                                    }
                                    
                                } else {
                                    lastUserName = connectUser.userProfile.userName
                                }
                                print(lastUserName)
                                self.editUserName.toggle()
                                
                                
                            }, label: {
                                Image(systemName: editUserName == false ? "gear" : "checkmark")
                                    .font(.system(size: 25))
                                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .trailing))
                            })
                        }
                    }
                    .padding()
                    
                    HStack{
                        Text("Телефон: \(connectUser.userProfile.phone)")
                            .font(.system(size: 25))
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .trailing))
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    
                    HStack{
                        Text("Бонусов: \(connectUser.userProfile.bonus)")
                            .font(.system(size: 25))
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .trailing))
                        Spacer()
                    }.padding(.leading)
                    
                    Spacer()
                    
                    Button(action: {
                        UserDefaults.standard.removeObject(forKey: "userMail")
                        connectUser.userProfile = User(id: -1, mail: "null", phone: "null", userName: "null", bonus: 0)
                    }, label: {
                        Text("Выйти")
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .trailing))
                            .font(.system(size: 30))
                            .padding(20)
                            .overlay(RoundedRectangle(cornerRadius: 30).stroke(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing), lineWidth: 3))
                    })
                    
                }
                
                
                
                Spacer()
            }.padding(.top).padding(.horizontal, 5)
            NotificationHUD(textNotification: textNotification)
                .offset(y: showHUD ? 0 : -200)
                .animation(.spring(), value: UUID())
        }
    }
    
    func limitText(_ upper: Int) {
        if connectUser.userProfile.userName.count > upper {
            connectUser.userProfile.userName = String(connectUser.userProfile.userName.prefix(upper))
            }
    }
    
    func dismissHUD(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.showHUD = false
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
