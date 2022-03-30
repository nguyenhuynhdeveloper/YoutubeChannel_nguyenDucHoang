//
//  Welcome.swift
//  MyApp
//
//  Created by Nguyen Duc Hoang on 27/03/2022.
//

import SwiftUI
//A view has 2 parts: View + Preview
//Build another View(screen) ?
struct WelcomeView: View {
    var body: some View {
        //press Cmd + Click to show "UI Inspector"
        //Vertical Stack
        VStack(alignment: .center) {
            //flexible size
            CircleImage(width: UIScreen.screenWidth / 2,
                        height: UIScreen.screenWidth / 2)
            Text("Welcome to my App")
                .font(.system(size: 23))
                .fontWeight(.bold)
                .padding(.top, 10)
                .padding(.bottom, 5) //setter
            Text("This is a training app, hope you like.Please subscribe to my Youtube Channel")
                .font(.system(size: 18))
                .multilineTextAlignment(.center)
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
