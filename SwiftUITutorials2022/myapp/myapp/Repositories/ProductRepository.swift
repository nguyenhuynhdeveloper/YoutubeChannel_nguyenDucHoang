//
//  ProductRepository.swift
//  MyApp
//
//  Created by Nguyen Duc Hoang on 28/03/2022.
//

import Foundation
class ProductRepository {
    var products:[Product] = [
        Product(
            id: 1,
            name: "iphone 3",
            title: "This is iphone 3",
            description: "",
            imageURL:"https://upload.wikimedia.org/wikipedia/commons/e/e6/IPhone_%26_iPhone_3G.jpg", latitude: 21.027964,
            longitude: 105.851013),
        Product(
            id: 2,
            name: "iphone 4",
            title: "This is iphone 4",
            description: "this is tesst ",
            imageURL:"", latitude: 21.027964,
                longitude: 105.851013
        )
    ]
}
