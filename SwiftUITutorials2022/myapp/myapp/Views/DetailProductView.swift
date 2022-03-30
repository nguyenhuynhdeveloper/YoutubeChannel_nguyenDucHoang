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
    var coordinateRegion:MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: product.latitude,
                longitude: product.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    }
    var selectedIndex: Int {
        productRepository.products.firstIndex(where: { $0.id == product.id })!
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
                Text(product.name)
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.bottom, 5)
                LikeButton(isFavorite: .constant(productRepository.products[selectedIndex].isFavorite))
                            //Horizontal Stack
                            HStack {
                                Text(product.title)
                                    .font(.subheadline)
                                //Remain space
                                Spacer()
                                Text(product.count > 0 ? "In stock" : "Call")
                                    .fontWeight(.bold)
                                    .foregroundColor(product.count > 0 ? .green : .red)
                            }
            }
            .padding()
            Divider()
            Text(product.description ?? "")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .padding(.top, 10)
                            .padding()
            Spacer()
        }
        .navigationTitle(product.name)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea()
        //Text("Hello World")
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
