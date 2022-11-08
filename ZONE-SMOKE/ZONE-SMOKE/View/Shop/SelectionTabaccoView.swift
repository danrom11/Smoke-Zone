//
//  SelectionTabaccoView.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 14.05.2022.
//

import SwiftUI

struct SelectionTabaccoView: View {
    
    //@Environment(\.presentationMode) var presentationMode
    @ObservedObject var connectFilter = FilterModel.shared
    @State var filterSearch = ""
    
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.top)
            VStack{
                TextField("Поиск", text: $filterSearch)
                    .foregroundColor(.white)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [.teal, .indigo]), startPoint: .bottomLeading, endPoint: .topTrailing))
                    .cornerRadius(35)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(FilterModel.shared.tabaccoFilters){filter in
                            ProductFilter(filter: filter)
                        }
                    }
                }
                
                ScrollView(.vertical){
                    ForEach(CatalogViewModel.shared.productsTabacco){item in
                        if(filterSearch.count == 0 && connectFilter.userFilters.count == 0){
                            ProductTobacco(product: item)
                                .padding(.top, 5)
                        } else if (connectFilter.searchFilter(product: item, search: filterSearch)){
                            ProductTobacco(product: item)
                                .padding(.top, 5)
                        }
                    }
                    HStack{
                    }
                    .frame(height: 100)
                }
                
                Spacer()
            }//.padding(.top, 50)
            ButtonReadyFilter()
        }.edgesIgnoringSafeArea(.bottom)
        
    }
}

struct SelectionTabaccoView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionTabaccoView()
        
    }
}


