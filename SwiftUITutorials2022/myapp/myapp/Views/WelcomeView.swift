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
    let welcomeMessages:[WelcomeMessage] = [
        WelcomeMessage(title: "SwiftUI Training Course 2022", description: "It is used for training only, many videos in my Youtube channel"),
        WelcomeMessage(title: "Youtube subscribe", description: "Please subscribe to my Youtube Channel for more useful videos"),
        WelcomeMessage(title: "SwiftUI Masterclass 2022", description: "iOS 15 App Development & Swift 5")
    ]
    @State private var isAnimated = false
    
    var body: some View {
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
                    Button(action: {
                        print("")
                    }) {
                        Text("Login or Register")
                            .frame(minWidth: 0, maxWidth: UIScreen.screenWidth/2)
                            .font(.system(size: 18))
                            .padding()
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                    .background(Color(237, 75, 106))
                    .cornerRadius(25)
                    //.transition(.slide)
                    //.transition(.move(edge: .bottom))
                    .animation(.linear(duration: 2.0), value: isAnimated)
                    
                    if welcomeMessages.last == welcomeMessage {
                        
                    }
                }
                .padding(20)
                .onAppear {
                    print("selected item : \(welcomeMessage.title)")
                    isAnimated.toggle()
                    if welcomeMessages.last == welcomeMessage {
                        isAnimated.toggle()
                    }
                }
            }
        }
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .center)
        .tabViewStyle(PageTabViewStyle())
        .ignoresSafeArea()
        
        
    }
}
//Preview = show in Canvas
struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
