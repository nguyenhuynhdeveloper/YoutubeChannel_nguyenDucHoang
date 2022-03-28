//
//  ProductListView.swift
//  MyApp
//
//  Created by Nguyen Duc Hoang on 28/03/2022.
//

import SwiftUI

struct ProductListView: View {
    var body: some View {
        //list of product's objects => get from "repository"
        List {
            ProductListItem(product: Product(
                id: 1,
                name: "iphone 3",
                title: "This is iphone 3",
                description: "",
                imageURL:"https://upload.wikimedia.org/wikipedia/commons/e/e6/IPhone_%26_iPhone_3G.jpg", latitude: 21.027964,
                    longitude: 105.851013)
            )
            .listRowInsets(EdgeInsets())            
        }
        .listStyle(PlainListStyle())
    }
    
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
