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
    //20.99885409532771, 105.85020497459129
    //@State private var = internal state
    //when state changes => UI reload
    @State private var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 20.99885409532771, longitude: 105.85020497459129),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    var radius: CGFloat = UIScreen.screenWidth / 4
    var body: some View {
        VStack(alignment: .center) {
            Map(coordinateRegion: $coordinateRegion)
                .frame(height: UIScreen.screenHeight / 2 )
            CircleImage(width: 2 * radius, height: 2 * radius)
                .offset(y: -radius)
            VStack(alignment: .leading) {
                            Text("Iphone 13 Pro max")
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.bottom, 5)
                            //Horizontal Stack
                            HStack {
                                Text("New Ultra Wide camera reveals more detail in the dark areas")
                                    .font(.subheadline)
                                //Remain space
                                Spacer()
                                Text("In stock")
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            }
            }
            .offset(y: -radius)
            .padding()
            Spacer()
        }.ignoresSafeArea()
        //Text("Hello World")
    }
}
//Now we create model, objects => display to ListView
struct DetailProductView_Previews: PreviewProvider {
    static var previews: some View {
        DetailProductView()
    }
}
