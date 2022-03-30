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
            name: "iphone 3 GS",
            title: "This is iphone 3",
            description: "",
            imageURL:"https://upload.wikimedia.org/wikipedia/commons/e/e6/IPhone_%26_iPhone_3G.jpg", latitude: 21.027964,
            longitude: 105.851013,
            isFavorite: true
        ),
        Product(
            id: 2,
            name: "iphone 4 test test",
            title: "This is iphone 4",
            description: "this is test data",
            imageURL:"https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Apple_iPhone_4_Bumper.jpg/640px-Apple_iPhone_4_Bumper.jpg",
            latitude: 20.844912,
                longitude: 106.688087,
            isFavorite: false
        ),
        Product(
            id: 3,
            name: "iphone 5",
            title: "iphone 5 is here",
            description: "iphone 5 for testing",
            imageURL:"https://cdn.vox-cdn.com/thumbor/kb8TZN9r_W6GPvflQSQUd0JgcDE=/0x17:1100x750/1820x1213/filters:focal(0x17:1100x750):format(webp)/cdn.vox-cdn.com/assets/3093949/iphone5_ios7.jpg",
            latitude: 20.257990,
                longitude: 105.975937,
            isFavorite: true
        ),
        Product(
            id: 4,
            name: "iphone 3 GS",
            title: "This is iphone 3",
            description: "",
            imageURL:"https://upload.wikimedia.org/wikipedia/commons/e/e6/IPhone_%26_iPhone_3G.jpg",
            latitude: 21.027964,
            longitude: 105.851013,
            isFavorite: true
        ),
        Product(
            id: 5,
            name: "iphone 4 test test",
            title: "This is iphone 4",
            description: "this is test data",
            imageURL:"https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Apple_iPhone_4_Bumper.jpg/640px-Apple_iPhone_4_Bumper.jpg",
            
            latitude: 20.844912,
            longitude: 106.688087,
            isFavorite: false
        ),
        Product(
            id: 6,
            name: "iphone 3 GS",
            title: "This is iphone 3",
            description: "",
            imageURL:"https://upload.wikimedia.org/wikipedia/commons/e/e6/IPhone_%26_iPhone_3G.jpg",
            latitude: 21.027964,
            longitude: 105.851013),
        Product(
            id: 7,
            name: "iphone 4 test test",
            title: "This is iphone 4",
            description: "this is test data",
            imageURL:"https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Apple_iPhone_4_Bumper.jpg/640px-Apple_iPhone_4_Bumper.jpg",
            latitude: 20.844912,
            longitude: 106.688087,
            isFavorite: true
        ),
    ]
}
