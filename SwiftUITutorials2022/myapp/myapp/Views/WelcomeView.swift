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
        ZStack {
            WelcomeShape()
            VStack {
                Text("Welcome to my App")
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                    .padding(.bottom, 5) //setter
            }
        }
    }
}
//Preview = show in Canvas
struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
