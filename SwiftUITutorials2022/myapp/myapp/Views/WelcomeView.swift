//
//  Welcome.swift
//  MyApp
//
//  Created by Nguyen Duc Hoang on 27/03/2022.
//

import SwiftUI
//A view has 2 parts: View + Preview
struct WelcomeView: View {
    var body: some View {
        //press Cmd + Click to show "UI Inspector"
        //Vertical Stack
        VStack(alignment: .leading) {
            Text("Iphone 13 Pro max")
                .font(.title)
                .foregroundColor(.black)
            //Horizontal Stack
            HStack {
                Text("New Ultra Wide camera reveals more detail in the dark areas")
                    .font(.subheadline)
                //Remain space
                Spacer()
                Text("In stock")
                    .foregroundColor(.green)
            }
        }
        .padding(10) //padding top, right, bottom, left = 10
        //.padding(.leading, 30) //only leading
        //Now how to add an ImageView ?
        //asset image
    }
}
//Preview = show in Canvas
struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
