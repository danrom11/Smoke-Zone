//
//  ProductTobaccoNew.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 15.05.2022.
//

import SwiftUI

struct ProductTobaccoAdd: View {
    
    var product : Product
    
    var body: some View {
        HStack{
            Image(product.imageUrl)
                .resizable()
                .frame(width: 90, height: 90)
                .overlay(RoundedRectangle(cornerRadius: 25).stroke(LinearGradient(gradient: Gradient(colors: [.indigo, .cyan]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2))
                .padding(.leading)
            VStack(alignment: .leading, spacing: 5){
                Text(product.title)
                    .font(.system(size: 18, weight: .light))
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.indigo, .teal]), startPoint: .leading, endPoint: .trailing))
                Text(product.taste)
                    .font(.system(size: 15, weight: .light))
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.indigo, .teal]), startPoint: .leading, endPoint: .trailing))
                Spacer()
            }.frame(width: 120,height: 90)
            Spacer()
            Image(systemName: "plus.circle")
                .font(.system(size: 50, weight: .light))
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.cyan, .indigo]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .padding(.trailing)
                
        }.frame(width: UIScreen.main.bounds.width - 30, height: 150)
        //    .padding()
            .overlay(RoundedRectangle(cornerRadius: 35).stroke(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing), lineWidth: 3))
    }
}

struct ProductTobaccoNew_Previews: PreviewProvider {
    static var previews: some View {
        ProductTobaccoAdd(product: Product(title: "Barvy Orange", imageUrl: "orangeTOBAK", price: 300, descript: "Вкус состоит из ароматизаторов помело, который является основным, и грейпфрута, который используется для придания вкуса цедра и горчинки. Сама аромка помело имеет кислинку и больше напоминает мякоть этого цитруса.", brand: "brand", taste: "Апельсин"))
    }
}
