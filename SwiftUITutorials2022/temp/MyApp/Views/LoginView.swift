//
//  LoginView.swift
//  MyApp
//
//  Created by Nguyen Duc Hoang on 04/04/2022.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Path { path in
                    path.addRect(CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.screenHeight))
                }
                .fill(.linearGradient(
                                Gradient(colors: [Color(43, 63, 121), Color(218, 64, 163)]),
                                startPoint: UnitPoint(x: 0, y: 1),
                                endPoint: UnitPoint(x: 1, y: 0)
                            ))
                
            }.ignoresSafeArea()
            VStack {
                Text("Login")
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
            }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
