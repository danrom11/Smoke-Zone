//
//  ProductFilter.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 19.05.2022.
//

import SwiftUI

struct ProductFilter: View {
    
    @State var onClick = false
    
    var filter : Filter
    
    var body: some View {
        HStack{
            Button(action: {
                self.onClick.toggle()
                if self.onClick == true {
                    FilterModel.shared.userFilters.append(filter)
                } else {
                    FilterModel.shared.userFilters.remove(at: FilterModel.shared.serchIndexFilter(filter: filter))
                }
                
                
            }, label: {
                Text(filter.title)
                    .foregroundColor(.white)
                    .padding(12)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(LinearGradient(gradient: Gradient(colors: [.indigo, .teal]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 3))
                    .background(self.onClick == true ? LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .leading, endPoint: .trailing) :  LinearGradient(gradient: Gradient(colors: [.clear]), startPoint: .leading, endPoint: .trailing)).cornerRadius(20)
                    .padding(5)
            })
            
        }
        
    }
}

struct ProductFilter_Previews: PreviewProvider {
    static var previews: some View {
        ProductFilter(filter: Filter(id: 1, title: "DarkSide (Core)"))
    }
}
