//
//  DetailsTobaccoView.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 15.05.2022.
//

import SwiftUI

struct DetailsFoodView: View {
    @Environment(\.presentationMode) var presentationMode
    var product : Product
    var columns: [GridItem] = [
        GridItem(.fixed(130), spacing: 5),
        GridItem(.fixed(130), spacing: 5),
        GridItem(.fixed(130), spacing: 5)
    ]
    
    var body: some View {
        ZStack{
            Color.black
            VStack{
                AsyncImage(url: URL(string: product.imageUrl.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)!, placeholder: {ProgressView()}, image: { image in
                    Image(uiImage: image)
                        .resizable()
                })
                    .frame(width: 120, height: 120)
                    .overlay(RoundedRectangle(cornerRadius: 35).stroke(LinearGradient(gradient: Gradient(colors: [.teal, .blue]), startPoint: .leading, endPoint: .trailing), lineWidth: 4)) .shadow(color: .indigo, radius: 3, x: 4, y: 6)
                    .cornerRadius(35)
                    .padding(.top, 6)
                
                Text(product.title)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.cyan, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                    .shadow(color: .teal, radius: 5, x: 0, y: 0)
                    .font(.system(size: 30, weight: .bold))
                Text(product.brand)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.cyan, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                    .shadow(color: .teal, radius: 5, x: 0, y: 0)
                    .font(.system(size: 15, weight: .bold))
                
                Text(product.descript)
                    .foregroundColor(.white)
                    .padding()
                
                HStack{
                    Text("Состав:")
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.cyan, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                        .font(.system(size: 25, weight: .bold))
                        .padding(.leading)
                    Spacer()
                }
                HStack{
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 1), count: 3), alignment: .center, spacing: 5, pinnedViews: [.sectionHeaders, .sectionFooters]){
                        ForEach(product.taste, id: \.hashValue){item in
                            Text(item)
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.cyan, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(LinearGradient(gradient: Gradient(colors: [.indigo, .teal]), startPoint: .leading, endPoint: .trailing), lineWidth: 3))
                        }
                    }
                    
                }
                
                
                
                Spacer()
                Button(action: { self.presentationMode.wrappedValue.dismiss()}, label: {
                    Text("Назад")
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.cyan, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                        .font(.system(size: 30, weight: .bold))
                        .padding()
                        .padding(.horizontal)
                        .overlay(RoundedRectangle(cornerRadius: 35).stroke(LinearGradient(gradient: Gradient(colors: [.cyan, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing), lineWidth: 3))
                        .padding()
                })
            }.padding(.top, 40)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct DetailsFoodView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsTobaccoView(product: Product(id: 92, title: "Салат цезарь", imageUrl: "https://povar.top/art/img/caesar-chicken-1.jpg", price: 300, descript: "Мой родной салатик", brand: "Cалаты", taste: ["Курица", "Сыр", "Салат", "Чери", "Гренки"], strong: 300, count: 0))
    }
}
