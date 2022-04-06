//
//  Color+Utilities.swift
//  MyApp
//
//  Created by Nguyen Duc Hoang on 05/04/2022.
//

import SwiftUI
extension Color {
    //extend Color's constructor
    //CGFloat = Core Graphics Float
    init(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) {
        self.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0)
    }
}
