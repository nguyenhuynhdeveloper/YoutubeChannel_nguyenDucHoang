//
//  InfiniteListView.swift
//  InfiniteListApp
//
//  Created by Nguyen Duc Hoang on 25/06/2022.
//

import SwiftUI

struct InfiniteListView: View {
    @ObservedObject var itemRepository:ItemRepository = ItemRepository.shared
    var body: some View {
        List {
            ForEach(itemRepository.items) { item in
                Text("haha")
            }
        }
        /*
        ZStack {
            List {
                ForEach(itemRepository.products, id: \.id) {
                    HStack {
                        Text("haha")
                    }
                }
                if itemRepository.isLoading {
                    HStack {
                                            Spacer()
                                            Circle()
                                                        .trim(from: 0, to: 0.7)
                                                        .stroke(Color.primary)
                                                        .frame(width: 50, height: 50)
                                                        .rotationEffect(Angle(degrees: 360))
                                                        .animation(Animation.default.repeatForever(autoreverses: false))
                                            Spacer()
                                        }
                }
            }
        }
        .onAppear() {
            itemRepository.getProducts(startIndex: 1, limit: 10)
        }
        */
    }
}

struct InfiniteListView_Previews: PreviewProvider {
    static var previews: some View {
        InfiniteListView()
    }
}
