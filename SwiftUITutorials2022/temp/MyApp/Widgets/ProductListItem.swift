//
//  ProductListItem.swift
//  MyApp
//
//  Created by Nguyen Duc Hoang on 28/03/2022.
//

import SwiftUI

struct ProductListItem: View {
    
    var product:Product
    var body: some View {
        //Async Image = Image "load" asynchronously
        HStack {
            AsyncImage(url: URL(string: product.imageURL ?? "")) { image in
                image.resizable()
            } placeholder: {
                Color.red
            }
            .frame(width: 80, height: 80, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(product.name)
            //Remain space
            Spacer()
            if product.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            
        }
        .padding(.leading, 10)
        .padding(.trailing, 10)
        .padding(.bottom, 10)
    }
}

struct ProductListItem_Previews: PreviewProvider {
    static var previews: some View {
        ProductListItem(product: Product(
            id: 1,
            name: "iphone 3",
            title: "This is iphone 3",
            description: "",
            imageURL:"https://upload.wikimedia.org/wikipedia/commons/e/e6/IPhone_%26_iPhone_3G.jpg",
            latitude: 21.027964,
            longitude: 105.851013,
            isFavorite: true,
            count: 10)
        )
    }
}
