//
//  LoginView.swift
//  MyApp
//
//  Created by Nguyen Duc Hoang on 06/04/2022.
//

import SwiftUI

struct LoginView: View {
    @State private var email:String = ""
    @State private var password:String = ""
    var body: some View {
        ZStack {
            WelcomeShape()
            VStack {
                HStack {
                    Image(systemName: "mail")
                    TextField("Password", text: $password)
                }.padding(.vertical, 10)
                    .overlay(Rectangle().frame(height: 1).padding(.top, 35))
                    .foregroundColor(Color.white)
                    .padding(.vertical,10)
                    .padding(.horizontal,20)
            }
        }
        .navigationBarHidden(true)
    }
    
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
