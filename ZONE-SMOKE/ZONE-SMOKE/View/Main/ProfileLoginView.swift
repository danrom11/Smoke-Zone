//
//  ProfileLogin.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 02.07.2022.
//

import SwiftUI
import Combine
import iPhoneNumberField
import PopupView

struct ProfileLoginView: View {
    @Environment(\.presentationMode) var presentationMode
    
    private var genCode = String(Int.random(in: 1000..<9999))
    
    @State private var mail = ""
    @State private var phone = "+7"
    @State private var code = ""
    
    @State private var showCodeTextField = false
    
    @State private var showHUD = false
    @State private var textNotification = "Неверный код"

    
    
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea(.all)
            
            
            
            VStack{
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
                    Text("Вход")
                        .font(.system(size: 32))
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                        //.padding(.top, 40)
                        .padding(.leading)
                    Spacer()
                }
                Spacer()
                TextField("Почта", text: $mail)
                    .font(.system(size: 24, weight: .light, design: .monospaced))
                    .foregroundColor(.white)
                    .submitLabel(.send)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(35)
                    .padding(.horizontal)
                    .disabled(showCodeTextField)
                HStack{
                    iPhoneNumberField("", text: $phone)
                        .prefixHidden(false)
                        .font(UIFont(size: 24, weight: .light, design: .monospaced))
                        .flagHidden(false)
                        .flagSelectable(true)
                        .maximumDigits(10)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(35)
                        .padding(.horizontal)
                        .disabled(showCodeTextField)
                }
                
                
                if(showCodeTextField == false){
                    Button(action: {
                        if(mail.count > 0 && mail.contains("@") && phone.count > 0){
                            NetworkModel.shared.sendCode(mail: mail, code: genCode)
                            self.showCodeTextField = true
                        } else {
                            self.textNotification = "Заполните все поля"
                            self.showHUD.toggle()
                        }
                    }, label: {
                        Text("Отправить")
                            .font(.system(size: 20))
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(LinearGradient(gradient: Gradient(colors: [.indigo, .teal]), startPoint: .topLeading, endPoint: .trailing), lineWidth: 3))
                    }).padding(.top)
                } else {
                    TextField("Код", text: $code)
                        .onReceive(Just(code)){ _ in limitText(4) }
                        .multilineTextAlignment(.center)
                        .font(.system(size: 24, weight: .light, design: .monospaced))
                        .keyboardType(.numberPad)
                        .foregroundColor(.white)
                        .submitLabel(.send)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(35)
                        .padding(.horizontal)
                        .padding(.top)
                        
                    
                    Button(action: {
                        if(code == genCode){
                            NetworkModel.shared.Login(mail: mail, phone: phone)
                            UserDefaults.standard.set(self.mail, forKey: "userMail")
                            self.presentationMode.wrappedValue.dismiss()
                        } else {
                            self.textNotification = "Неверный код"
                            self.showHUD.toggle()
                        }
                    }, label: {
                        Text("Войти")
                            .font(.system(size: 30))
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(LinearGradient(gradient: Gradient(colors: [.indigo, .teal]), startPoint: .topLeading, endPoint: .trailing), lineWidth: 3))
                    }).padding(.top)
                }
                
                
                Spacer()
            }
            .popup(isPresented: $showHUD, type: .default, position: .top, autohideIn: 2.0, dragToDismiss: true){
                ZStack{
                    VStack{
                        HStack{
                            Text(textNotification)
                                .foregroundColor(.white)
                                .padding()
                                .background(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(35)
                                .shadow(color: .teal, radius: 5, x: 0, y: 4)
                        }.padding(.top, 40)
                        Spacer()
                    }
                }
            }
        }
    }
    func limitText(_ upper: Int) {
            if code.count > upper {
                code = String(code.prefix(upper))
            }
    }
}



struct ProfileLogin_Previews: PreviewProvider {
    static var previews: some View {
        ProfileLoginView()
    }
}
