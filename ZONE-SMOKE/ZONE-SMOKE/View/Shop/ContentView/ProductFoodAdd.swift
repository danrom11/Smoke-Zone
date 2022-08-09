//
//  ProductFood.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 17.06.2022.
//

import SwiftUI

struct ProductFoodAdd: View {
    
    var product : Product
    
    var connectCartFood = CatalogViewModel.shared
   // @State var selected = false
    @State var click = false
    @State var count = 0
    
    var body: some View {
        HStack{
            Button(action: {
                self.click.toggle()
               //print(connectCartFood.cartFood)
                //print(product.count)
            }, label: {
                AsyncImage(url: URL(string: product.imageUrl.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)!, placeholder: {ProgressView()}, image: { image in
                    Image(uiImage: image)
                        .resizable()
                        
                })
                .frame(width: 90, height: 90)
                .overlay(RoundedRectangle(cornerRadius: 25).stroke(LinearGradient(gradient: Gradient(colors: [.indigo, .cyan]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 3))
                    .cornerRadius(25)
                    .padding(.leading)
            }).sheet(isPresented: $click){
                DetailsFoodView(product: product)
            }
            
            VStack(alignment: .leading, spacing: 0){
                Text(product.title)
                    .font(.system(size: 18, weight: .light))
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.indigo, .teal]), startPoint: .leading, endPoint: .trailing))
                Text(product.brand)
                    .font(.system(size: 12, weight: .light))
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.indigo, .teal]), startPoint: .leading, endPoint: .trailing))
                Spacer()
                Text("\(product.price.formatted()) ₽")
                    .font(.system(size: 17, weight: .light))
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.indigo, .teal]), startPoint: .leading, endPoint: .trailing))
                    .padding(.bottom)
             
                
            }.frame(width: 120,height: 90)
            Spacer()
            
            VStack{
                Text("Кол \(count)")
                    .font(.system(size: 25))
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing))
                HStack{
                    Button(action: {
                        count += 1
                        if(connectCartFood.checkProductInCartFood(product: product) > 0){
                            connectCartFood.addProductCountCartFood(id: connectCartFood.serchIndex(product: product, array: connectCartFood.cartFood))
                        } else {
                            connectCartFood.cartFood.append(product)
                        }
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 25))
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing))
                    })
                    
                    Button(action: {
                        
                        if(connectCartFood.checkProductInCartFood(product: product) > 0){
                            count -= 1
                            connectCartFood.removeProductCountCartFood(id: connectCartFood.serchIndex(product: product, array: connectCartFood.cartFood))
                        }
                        
                    }, label: {
                        Image(systemName: "minus.circle")
                            .font(.system(size: 25))
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing))
                    })
                }
            }.padding(.trailing)
            
            
            
            
        }.frame(width: UIScreen.main.bounds.width - 30, height: 150)
        //    .padding()
            .overlay(RoundedRectangle(cornerRadius: 35).stroke(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing), lineWidth: 3))
            .padding(.horizontal)
            .onAppear{
                count = connectCartFood.checkProductInCartFood(product: product)
            }
    }
}

struct ProductFood_Previews: PreviewProvider {
    static var previews: some View {
        ProductFoodAdd(product: Product(id: 92, title: "Салат цезарь", imageUrl: "https://povar.top/art/img/caesar-chicken-1.jpg", price: 300, descript: "Мой родной салатик", brand: "Cалаты", taste: ["Курица", "Сыр", "Салат", "Чери", "Гренки"], strong: 300, count: 0))
    }
}
