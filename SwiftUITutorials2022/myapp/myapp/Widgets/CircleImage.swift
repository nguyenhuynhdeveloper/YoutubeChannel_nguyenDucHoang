//
//  CircleImage.swift
//  MyApp
//
//  Created by Nguyen Duc Hoang on 27/03/2022.
//

import SwiftUI

struct CircleImage: View {
    //flexible size
    //CG = Core Graphics
    var width: CGFloat? //props
    var height: CGFloat?
    var body: some View {
        Image("iphone13ProMax")
            .resizable()
            .frame(width: width, height: height, alignment: .center)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 5.0)
            }
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(width: 300, height: 300)
    }
}
