//
//  CircleImage.swift
//  MyApp
//
//  Created by Nguyen Duc Hoang on 27/03/2022.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("iphone13ProMax")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.gray, lineWidth: 5.0)
            }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
