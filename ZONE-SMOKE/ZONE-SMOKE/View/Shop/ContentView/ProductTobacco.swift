//
//  ProductTobaccoNew.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 15.05.2022.
//

import SwiftUI

struct ProductTobacco: View {
    
    
    
    
    var product : Product
    @ObservedObject var sh = CatalogViewModel.shared
    @State var selected = false
    @State var click = false
    
    var body: some View {
        
        
        HStack{
            Button(action: {
                self.click.toggle()
            }, label: {
                
                
                
                AsyncImage(url: URL(string: product.imageUrl.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)!, placeholder: {ProgressView()}, image: { image in
                    Image(uiImage: image)
                        .resizable()
                        
                })
                .frame(width: 90, height: 90)
                .overlay(RoundedRectangle(cornerRadius: 25).stroke(LinearGradient(gradient: Gradient(colors: [.indigo, .cyan]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 3))
                    .cornerRadius(25)
                    .padding(.leading)
                
                
//                Image(product.imageUrl)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 90, height: 90)
//                    .overlay(RoundedRectangle(cornerRadius: 25).stroke(LinearGradient(gradient: Gradient(colors: [.indigo, .cyan]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2))
//                    .cornerRadius(25)
//                    .padding(.leading)
                
                
            }).sheet(isPresented: $click){
                DetailsTobaccoView(product: product)
            }
            
            VStack(alignment: .leading, spacing: 0){
                Text(product.title)
                    .font(.system(size: 18, weight: .light))
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.indigo, .teal]), startPoint: .leading, endPoint: .trailing))
                Text(product.brand)
                    .font(.system(size: 12, weight: .light))
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.indigo, .teal]), startPoint: .leading, endPoint: .trailing))
                Spacer()
                Text("Крепость: \(product.strong)")
                    .font(.system(size: 17, weight: .light))
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.indigo, .teal]), startPoint: .leading, endPoint: .trailing))
                    .padding(.bottom)
             
                
            }.frame(width: 120,height: 90)
            Spacer()
            
            Button(action: {
                
                if(sh.serchIndex(product: product, array: sh.cartTabacco) == -1){
                    sh.cartTabacco.append(product)
                } else {
                    sh.cartTabacco.remove(at: sh.serchIndex(product: product, array: sh.cartTabacco))
                }
                self.selected.toggle()
            }, label: {
                // var check = selected == true ? "plus.circle" : "checkmark.circle"
                Image(systemName: sh.serchIndex(product: product, array: sh.cartTabacco) == -1 ? "plus.circle" : "xmark.circle")
                    .font(.system(size: 50, weight: .light))
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.cyan, .indigo]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .padding(.trailing)
            })
            
            
            
        }.frame(width: UIScreen.main.bounds.width - 30, height: 150)
        //    .padding()
            .overlay(RoundedRectangle(cornerRadius: 35).stroke(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing), lineWidth: 3))
            .padding(.horizontal)
        
    }
}

struct ProductTobaccoNew_Previews: PreviewProvider {
    static var previews: some View {
        ProductTobacco(product: Product(id: 765, title: "Barvy Orange", imageUrl: "https://smogus.cc/wp-content/uploads/2020/03/tabak16.jpg", price: 300, descript: "Вкус состоит из ароматизаторов помело, который является основным, и грейпфрута, который используется для придания вкуса цедра и горчинки. Сама аромка помело имеет кислинку и больше напоминает мякоть этого цитруса.", brand: "DarkSide (Core)", taste: ["Апельсин", "Грейпфрукт"], strong: 1, count: 1))
    }
}
