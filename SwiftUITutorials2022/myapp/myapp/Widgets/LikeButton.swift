//
//  LikeButton.swift
//  MyApp
//
//  Created by Nguyen Duc Hoang on 30/03/2022.
//

import SwiftUI

struct LikeButton: View {
    //Changes made inside this view propagate back to the data source.
    @Binding var isFavorite: Bool
    
    var body: some View {
        Button(action: {
            self.isFavorite.toggle()
            print("haha")
        }, label: {
            Image(systemName: isFavorite ? "star.fill" : "star")
                .foregroundColor(isFavorite ? .yellow : .gray)
        }).padding(10)
    }
}

struct LikeButton_Previews: PreviewProvider {
    static var previews: some View {
        LikeButton(isFavorite: .constant(true))
    }
}
