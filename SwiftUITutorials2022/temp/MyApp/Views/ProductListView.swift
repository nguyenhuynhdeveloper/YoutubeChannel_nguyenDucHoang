//
//  ProductListView.swift
//  MyApp
//
//  Created by Nguyen Duc Hoang on 28/03/2022.
//

import SwiftUI

//Now we filter the list(favorites or NOT favorites)
struct ProductListView: View {    
    //var products:[Product] = ProductRepository().products
    @EnvironmentObject var productRepository: ProductRepository
    @State private var showFavoritesOnly = true
    //filteredProducts must be a FUNCTION !
    var filteredProducts:[Product] {
        productRepository.products.filter { eachProduct in
            if(showFavoritesOnly == true) {
                return eachProduct.isFavorite == true
            } else {
                return true
            }
            
        }
        
    }
    var body: some View {
        //list of product's objects => get from "repository"
        //How to navigate to "DetailProductView" ?
        NavigationView {
            VStack {
                //$ = Binding
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Show only favorites")
                        .font(.system(size: 18))
                        .bold()
                })
                .padding()
                List(filteredProducts, id: \.id) { product in
                    ZStack(alignment: .leading, content: {
                        NavigationLink(destination: {
                            DetailProductView(product: product)
                        }, label: {
                            EmptyView()
                        })
                        .opacity(0)
                        ProductListItem(product:product)
                    })
                    .listRowInsets(EdgeInsets())
                }
                .listStyle(PlainListStyle())
                .navigationBarHidden(true)
            }
        }
    }
    
    
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
