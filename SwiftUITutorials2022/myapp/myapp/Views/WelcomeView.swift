//
//  WelcomeView.swift
//  MyApp
//
//  Created by Nguyen Duc Hoang on 05/04/2022.
//

import SwiftUI

struct WelcomeView: View {
    let welcomeMessages:[WelcomeMessage] = [
            WelcomeMessage(title: "SwiftUI Training Course 2022", description: "It is used for training only, many videos in my Youtube channel"),
            WelcomeMessage(title: "Youtube subscribe", description: "Please subscribe to my Youtube Channel for more useful videos"),
            WelcomeMessage(title: "SwiftUI Masterclass 2022", description: "iOS 15 App Development & Swift 5")
        ]
    @State private var offset:CGFloat = UIScreen.screenHeight
    var body: some View {
        NavigationView {
            ZStack {
                WelcomeShape()
                TabView {
                    ForEach(welcomeMessages, id: \.self) { welcomeMessage in
                        VStack(alignment: .leading, spacing: 20) {
                            Text(welcomeMessage.title)
                                .font(.system(size: 50))
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                            Text(welcomeMessage.description)
                                .font(.system(size: 23))
                                .foregroundColor(Color.white)
                            if welcomeMessages.last == welcomeMessage {
                                NavigationLink(destination: LoginView()) {
                                    Text("Login or Register")
                                        .frame(minWidth: 0,
                                               maxWidth: UIScreen.screenWidth/2)
                                        .font(.system(size: 18))
                                        .padding()
                                        .foregroundColor(.white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 25)
                                                .stroke(Color.white, lineWidth: 2)
                                        )
                                        .background(Color(237, 75, 106))
                                        .cornerRadius(25)
                                        .offset(x: 0.0, y: offset)
                                }
                            }
                        }
                        .padding(20)
                        .onAppear {
                            self.offset = UIScreen.screenHeight
                            print("selected item : \(welcomeMessage.title)")
                            if welcomeMessages.last == welcomeMessage {
                                withAnimation(.linear(duration: 1)) { self.offset = 0 }
                            }
                        }
                    }
                }
                .frame(width: UIScreen.screenWidth,
                       height: UIScreen.screenHeight,
                       alignment: .center)
                .tabViewStyle(PageTabViewStyle())
            }
            .ignoresSafeArea()
        }
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
