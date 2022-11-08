//
//  HookahButton.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 15.08.2022.
//

import SwiftUI

struct HookahButton: View {
    
    var hookah : Hookah
    
    @ObservedObject var connectHookah = HookahAssemblyModel.shared
    @ObservedObject var sh = CatalogViewModel.shared
    
    @Binding var activateRootLink : Bool
    @Binding var IDReadyHookah : Int
    
    var body: some View {
        ZStack{
            
            Image("hookahBack")
                .resizable()
                .blur(radius: 3, opaque: true)
                .cornerRadius(35)
            
            Color.black
                .opacity(0.5)
                .cornerRadius(35)
            
            
            
            Button(action: {
                IDReadyHookah = hookah.id
                connectHookah.selectedBowl = hookah.bowl
                connectHookah.selectedFlask = hookah.flask
                sh.cartTabacco = hookah.tobacco
                
                activateRootLink = true
            }, label: {
                VStack(alignment: .leading, spacing: 5){
                    HStack{
                        Text(hookah.title)
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .padding([.leading, .top])
                        Spacer()
                    }
                    
                    HStack{
                        Text("Кальян из \(hookah.tobacco.count > 1 ? "\(hookah.tobacco.count) миксов" : "\(hookah.tobacco.count) микса")")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                            .padding(.leading)
                        Spacer()
                    }
                    
                    
                    
                    Spacer()
                }
            })
            
            VStack{
                HStack{
                    Spacer()
                    Button(action: {
                        connectHookah.removeHookah(hookah: hookah)
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 50, weight: .light))
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.cyan, .indigo]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    })
                    .padding()
                }
            }
            
            
            
            
        }.frame(width: UIScreen.main.bounds.width - 30, height: 150)
            .overlay(RoundedRectangle(cornerRadius: 35).stroke(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing), lineWidth: 3))
            .padding(.horizontal)
    }
    
    
    struct HookahButton_Previews: PreviewProvider {
        static var previews: some View {
            HookahButton(hookah: Hookah(id: 1, title: "Топ кальян за свои денги", bowl: ElementHookah(id: 0, price: 0, image: "hookahStandart", text: "На чаше", typeObject: "standart"), flask: ElementHookah(id: 0, price: 0, image: "InBotleWater", text: "На воде", typeObject: "water"), tobacco: [Product](arrayLiteral: Product(id: 765, title: "Barvy Orange", imageUrl: "https://smogus.cc/wp-content/uploads/2020/03/tabak16.jpg", price: 300, descript: "Вкус состоит из ароматизаторов помело, который является основным, и грейпфрута, который используется для придания вкуса цедра и горчинки. Сама аромка помело имеет кислинку и больше напоминает мякоть этого цитруса.", brand: "DarkSide (Core)", taste: ["Апельсин", "Грейпфрукт"], strong: 1, count: 1))), activateRootLink: .constant(false), IDReadyHookah: .constant(-1))
        }
    }
    
}
