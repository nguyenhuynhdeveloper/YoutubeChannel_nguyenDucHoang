//
//  DetailProductView.swift
//  MyApp
//
//  Created by Nguyen Duc Hoang on 27/03/2022.
//

import SwiftUI
import MapKit
//Apple Map ?
struct DetailProductView: View {
    @EnvironmentObject var productRepository: ProductRepository
    //20.99885409532771, 105.85020497459129
    //@State private var = internal state
    //when state changes => UI reload
    var product:Product
    @State private var updatedProduct:Product = Product(id: 0, name: "", title: "", description: "", imageURL: "", latitude: 0, longitude: 0, isFavorite: false, count: 0)
    
    
    //var updateProduct:((Int, Product)->Void)?
    var coordinateRegion:MKCoordinateRegion {
        print("aa")
        return MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: updatedProduct.latitude,
                longitude: updatedProduct.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    }
    
    var selectedIndex: Int {
        productRepository.products.firstIndex(where: { $0.id == updatedProduct.id })!
    }
    
    var radius: CGFloat = UIScreen.screenWidth / 4
    var body: some View {
        ScrollView {
            Map(coordinateRegion: .constant(coordinateRegion))
                .frame(height: UIScreen.screenHeight / 2 )
            CircleImage(width: 2 * radius, height: 2 * radius)
                .offset(y: -radius)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text(updatedProduct.name)
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.bottom, 5)
                            //Horizontal Stack
                            HStack {
                                Text(updatedProduct.title)
                                    .font(.subheadline)
                                //Remain space
                                Spacer()
                                Text(updatedProduct.count > 0 ? "In stock" : "Call")
                                    .fontWeight(.bold)
                                    .foregroundColor(updatedProduct.count > 0 ? .green : .red)
                            }
            }
            .padding()
            Divider()
            Text(updatedProduct.description ?? "")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .padding(.top, 10)
                            .padding()
            Spacer()
        }
        .navigationTitle(updatedProduct.name)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea()
        //Text("Hello World")
        .onAppear {
            self.updatedProduct = product
        }
        
    }
    
}
//Now we create model, objects => display to ListView
struct DetailProductView_Previews: PreviewProvider {
    static let productRepository = ProductRepository() //get existing ProductRepository Object
    static var previews: some View {
        DetailProductView(product: productRepository.products[0])
            .environmentObject(productRepository)
    }
}
