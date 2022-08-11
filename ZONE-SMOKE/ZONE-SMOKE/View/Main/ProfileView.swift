//
//  ProfileView.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 10.06.2022.
//

import SwiftUI
import Combine
import CoreImage
import CoreImage.CIFilterBuiltins

import QRCode

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
                    Color.white
                }
                .frame(width: 25, height: 5)
                .cornerRadius(35)
                
                HStack{
                    FlashCard(front: {
                        VStack{
                            HStack{
                                Text("Zona Dыма")
                                    .font(.system(size: 25))
                                    .foregroundColor(.white)
                                    .padding([.leading, .top])
                                Spacer()
                                
                            }
                            HStack{
                                Text(connectUser.userProfile.id == -1 ? "Гость" : connectUser.userProfile.userName)
                                    .font(.system(size: 15))
                                    .foregroundColor(.white)
                                    .padding(.leading)
                                Spacer()
                            }
                            Spacer()
                            
                            HStack{
                                Text("Дыма: \(connectUser.userProfile.bonus)")
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                    .padding()
                                Spacer()
                                
                                Text("Cash Back: \(connectUser.userProfile.cashBack)%")
                                    .font(.system(size: 15))
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            
                        }
                    }, back: {
                        VStack{
                            if(connectUser.userProfile.id != -1){
                                Image(uiImage: generationQrCode(from: "id: \(connectUser.userProfile.id)\nUser: \(connectUser.userProfile.userName)\nMail: \(connectUser.userProfile.mail)\nPhone: \(connectUser.userProfile.phone)\nBonus: \(connectUser.userProfile.bonus)\nCash Back: \(connectUser.userProfile.cashBack)"))
                                    .resizable()
                                    .interpolation(.none)
                                    .scaledToFit()
                            }
                        }
                        
                    })
                }
                
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
                        connectUser.userProfile = User(id: -1, mail: "null", phone: "null", userName: "null", bonus: 0, cashBack: 0)
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
    
    func generationQrCode(from string: String) -> UIImage{
    
        let doc1 = QRCode.Document(utf8String: string, errorCorrection: .low)
        doc1.design.backgroundColor(UIColor.clear.cgColor)
        doc1.design.shape.eye = QRCode.EyeShape.RoundedOuter()
        doc1.design.shape.onPixels = QRCode.PixelShape.Circle()
        doc1.design.style.onPixels = QRCode.FillStyle.Solid(UIColor.white.cgColor)
        
        // Generate a image for the QRCode
        let cgImage = doc1.uiImage(CGSize(width: 150, height: 150))
        
        return cgImage ?? UIImage()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


struct FlashCard<Front, Back>: View where Front: View, Back: View {
    var front: () -> Front
    var back: () -> Back
    
    @State var flipped: Bool = false
    
    @State var flashCardRotation = 0.0
    @State var contentRoatation = 0.0
    
    init(@ViewBuilder front: @escaping () -> Front, @ViewBuilder back: @escaping () -> Back){
        self.front = front
        self.back = back
    }
    
    var body: some View {
        ZStack{
            if flipped {
                back()
            } else {
                front()
            }
        }.rotation3DEffect(.degrees(contentRoatation), axis: (x: 0, y: -1, z: 0))
        .padding()
        .frame(height: 200)
        .frame(maxWidth: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(35)
        .padding()
        .onTapGesture {
            flipFlashCard()
        }
        .rotation3DEffect(.degrees(flashCardRotation), axis: (x: 0, y: -1, z: 0))
    }
    func flipFlashCard() {
        let animationTime = 0.6
        withAnimation(Animation.linear(duration: animationTime)){
            flashCardRotation += 180
        }
        
        withAnimation(Animation.linear(duration: 0.001).delay(animationTime / 2)){
            contentRoatation += 180
            flipped.toggle()
        }
    }
}
