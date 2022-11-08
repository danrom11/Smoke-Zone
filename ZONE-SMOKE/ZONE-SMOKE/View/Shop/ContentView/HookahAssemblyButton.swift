//
//  HookahAssemblyButton.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 25.08.2022.
//

import SwiftUI

struct HookahAssemblyButton: View {
    
    var hookahAssembly : HookahAssembly
    
    @ObservedObject private var connectHookahAssembly = HookahAssemblyModel.shared
    @State private var showAlertRemoveMyHookahAssembly = false
    
    @Binding var openHookahAssembly : Bool
    
    
    @State private var showFood : Bool = false
    
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
                //print("Array -> \(hookahAssembly)")
                connectHookahAssembly.hookahs = hookahAssembly.hookah
                
                openHookahAssembly = true
            }, label: {
                VStack(alignment: .leading, spacing: 5){
                    HStack{
                        Text(hookahAssembly.title)
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .padding([.leading, .top])
                        Spacer()
                    }
                    
                    HStack{
                        Text("\(hookahAssembly.hookah.count) \(hookahAssembly.hookah.count < 5 ? hookahAssembly.hookah.count == 1 ? "кальян" : "кальяна" : "кальянов")")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                            .padding(.leading)
                        
                        Spacer()
                    }
                    
                 
                    
                    
                    Spacer()
                    HStack{
                        Text("\(hookahAssembly.hookah.count * 4)  ≤")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                            //.padding(.leading)
                        Image(systemName: "person.3.fill")
                            .foregroundColor(.white)
                            //.foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    }.padding(.leading)
                    
                    
                    Spacer()
                }
            })
            
            VStack{
                HStack{
                    HStack{
                        Spacer()
                        Button(action: {
                            
                            if(connectHookahAssembly.checkMyHookahAssembly(hookahAssembly: hookahAssembly) == -1){
                                connectHookahAssembly.myHookahAssembly.append(hookahAssembly)
                                UserDefaults.standard.set(try? PropertyListEncoder().encode(connectHookahAssembly.myHookahAssembly), forKey: "myHookahAssembly")
                            } else {
                                showAlertRemoveMyHookahAssembly = true
                            }
                            
                            print("chek")
                            print(connectHookahAssembly.myHookahAssembly)
                           
                            
                            
                        }, label: {
                            Image(systemName: connectHookahAssembly.checkMyHookahAssembly(hookahAssembly: hookahAssembly) == -1 ? "heart" : "heart.fill")
                                .foregroundColor(.red)
                                .padding()
                        }).alert(isPresented: $showAlertRemoveMyHookahAssembly){
                            Alert(title: Text("Вы действительно хотите убрать избранное?"), message: Text("Данная сборка будет навсегда удалена из избранного"), primaryButton: .destructive(Text("Удалить")) {
                                connectHookahAssembly.myHookahAssembly.remove(at: connectHookahAssembly.checkMyHookahAssembly(hookahAssembly: hookahAssembly))
                                UserDefaults.standard.set(try? PropertyListEncoder().encode(connectHookahAssembly.myHookahAssembly), forKey: "myHookahAssembly")
                            }, secondaryButton: .cancel(Text("Отмена")))
                        }
                        
                    }
                    
                }
                Spacer()
            }
            
            VStack{
                HStack{
                    Spacer()
                    
                    
                    NavigationLink(isActive: $showFood, destination: {FoodView(activeRootLink: $showFood)}, label: {
                        Image(systemName: "cart.circle")
                            .font(.system(size: 50, weight: .light))
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.cyan, .indigo]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    }).isDetailLink(false)
                        .simultaneousGesture(TapGesture().onEnded({
                            connectHookahAssembly.hookahs = hookahAssembly.hookah
                        }))
                        .padding()
                }
            }
            
            
            
            
        }.frame(width: UIScreen.main.bounds.width - 30, height: 150)
            .overlay(RoundedRectangle(cornerRadius: 35).stroke(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing), lineWidth: 3))
            .padding(.horizontal)
    }
}

struct HookahAssemblyButton_Previews: PreviewProvider {
    static var previews: some View {
        HookahAssemblyButton(hookahAssembly: HookahAssembly(id: 1, title: "test", hookah: [Hookah](arrayLiteral: Hookah(id: 1, title: "test2", bowl: ElementHookah(id: 0, price: 0, image: "hookahStandart", text: "На чаше", typeObject: "standart"), flask: ElementHookah(id: 0, price: 0, image: "InBotleWater", text: "На воде", typeObject: "water"), tobacco: [Product](arrayLiteral: Product(id: 765, title: "Barvy Orange", imageUrl: "https://smogus.cc/wp-content/uploads/2020/03/tabak16.jpg", price: 300, descript: "Вкус состоит из ароматизаторов помело, который является основным, и грейпфрута, который используется для придания вкуса цедра и горчинки. Сама аромка помело имеет кислинку и больше напоминает мякоть этого цитруса.", brand: "DarkSide (Core)", taste: ["Апельсин", "Грейпфрукт"], strong: 1, count: 1))))), openHookahAssembly: .constant(false))
    }
}
