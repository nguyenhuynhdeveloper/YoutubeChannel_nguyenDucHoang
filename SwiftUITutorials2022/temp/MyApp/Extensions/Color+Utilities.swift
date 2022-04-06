//
//  Color+Utilities.swift
//  MyApp
//
//  Created by Nguyen Duc Hoang on 02/04/2022.
//

import SwiftUI
extension Color {
    init(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) {
        self.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0)
    }
}
