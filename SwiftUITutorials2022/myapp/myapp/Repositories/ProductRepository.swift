//
//  ProductRepository.swift
//  MyApp
//
//  Created by Nguyen Duc Hoang on 28/03/2022.
//

import Foundation
final class ProductRepository: ObservableObject {
    @Published var products:[Product] = [
        Product(
            id: 1,
            name: "iphone 3 GS",
            title: "This is iphone 3",
            description: "The iPhone 3G is a smartphone designed and marketed by Apple Inc.; it is the second generation of iPhone, successor to the original iPhone, and was introduced on June 9, 2008, at the WWDC 2008 at the Moscone Center in San Francisco, United States",
            imageURL:"https://upload.wikimedia.org/wikipedia/commons/e/e6/IPhone_%26_iPhone_3G.jpg", latitude: 21.027964,
            longitude: 105.851013,
            isFavorite: true,
            count: 2
        ),
        Product(
            id: 2,
            name: "iphone 4 test test",
            title: "This is iphone 4",
            description: "The iPhone 4 is a smartphone that was designed and marketed by Apple Inc. It is the fourth generation of the iPhone lineup, succeeding the iPhone 3GS and preceding the 4S. Following a number of notable leaks, the iPhone 4 was first unveiled on June 7, 2010, at Apple's Worldwide Developers Conference in San Francisco,[9] and was released on June 24, 2010, in the United States, United Kingdom, France, Germany, and Japan",
            imageURL:"https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Apple_iPhone_4_Bumper.jpg/640px-Apple_iPhone_4_Bumper.jpg",
            latitude: 20.844912,
                longitude: 106.688087,
            isFavorite: false,
            count: 10
        ),
        Product(
            id: 3,
            name: "iphone 5",
            title: "iphone 5 is here",
            description: "The iPhone 5 is a smartphone that was designed and marketed by Apple Inc. It is the 6th generation iPhone, succeeding the iPhone 4S and preceding both the iPhone 5S and 5C. It was formally unveiled as part of a press event on September 12, 2012, and subsequently released on September 21, 2012.[12] The iPhone 5 was the first iPhone to be announced in September, and setting a trend for subsequent iPhone releases, the first iPhone to be completely developed under the guidance of Tim Cook and the last iPhone to be overseen by Steve Jobs. The iPhone 5's design was used three times, first with the iPhone 5 itself in 2012, then with the 5S in 2013, and finally with the first-generation iPhone SE in 2016. It had a 4-inch screen, similar to the iPhone 5C and iPhone 5S, and was released about ten months after Steve Jobs died",
            imageURL:"https://cdn.vox-cdn.com/thumbor/kb8TZN9r_W6GPvflQSQUd0JgcDE=/0x17:1100x750/1820x1213/filters:focal(0x17:1100x750):format(webp)/cdn.vox-cdn.com/assets/3093949/iphone5_ios7.jpg",
            latitude: 20.257990,
                longitude: 105.975937,
            isFavorite: true,
            count: 0
        ),
        Product(
            id: 6,
            name: "iphone 6",
            title: "The iPhone 6 and iPhone 6 Plus",
            description: "The iPhone 6 and iPhone 6 Plus are smartphones that were designed and marketed by Apple Inc. They are the eighth generation of the iPhone, succeeding the iPhone 5S, and were announced on September 9, 2014, and released on September 19, 2014.[20] The iPhone 6 and iPhone 6 Plus jointly were themselves replaced as the flagship devices of the iPhone series by the iPhone 6S and iPhone 6S Plus on September 9, 2015. The iPhone 6 and 6 Plus include larger 4.7 and 5.5 inches (120 and 140 mm) displays, a faster processor, upgraded cameras, improved LTE and Wi-Fi connectivity and support for a near field communications-based mobile payments offering.",
            imageURL:"https://upload.wikimedia.org/wikipedia/commons/e/e6/IPhone_%26_iPhone_3G.jpg",
            latitude: 21.027964,
            longitude: 105.851013,
            isFavorite: false,
            count: 6
        ),
        Product(
            id: 7,
            name: "The iPhone 7 and iPhone 7 Plus ",
            title: "he iPhone 7 has a 1,960 mAh battery which can last about 10 hours,",
            description: "Reception to the iPhone 7 was mixed. Gordon Kelly of Forbes noted that rival smartphones, such as the Samsung Galaxy S7, had increased battery life and added water resistance over its predecessor while retaining the headphone jack, and that the iPhone 7's camera photo quality was improved but still lagging behind some phones already on the market, including the Galaxy S7 and Nexus 6P",
            imageURL:"https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Apple_iPhone_4_Bumper.jpg/640px-Apple_iPhone_4_Bumper.jpg",
            
            latitude: 20.844912,
            longitude: 106.688087,
            isFavorite: true,
            count: 7
        ),
        Product(
            id: 8,
            name: "The iPhone 8 and iPhone 8 Plus ",
            title: "The iPhone 8 and 8 Plus retain the Retina HD Display found in the iPhone 7,",
            description: "The iPhone 8 and iPhone 8 Plus are smartphones designed, developed, and marketed by Apple Inc. They make up the 11th generation of the iPhone. The iPhone 8 was released on September 22, 2017, succeeding the iPhone 7 and iPhone 7 Plus[8] and preceding the iPhone X. The iPhone 8, and iPhone 8 Plus were discontinued by Apple on April 15, 2020 with the release of the second-generation iPhone SE.Except for addition of a glass back, the designs of iPhone 8 and 8 Plus are largely similar to that of their predecessors.",
            imageURL:"https://upload.wikimedia.org/wikipedia/commons/e/e6/IPhone_%26_iPhone_3G.jpg",
            latitude: 21.027964,
            longitude: 105.851013,
            isFavorite: false,
            count: 0
        ),
        Product(
            id: 9,
            name: " iPhone 13 and iPhone 13 Mini ",
            title: "iPhone 13 Mini use an Apple-designed A15 Bionic system on a chip.",
            description: "The iPhone 13 and iPhone 13 Mini (stylized as iPhone 13 mini) are smartphones designed, developed, marketed, and sold by Apple Inc. They are the fifteenth generation of iPhones (succeeding the iPhone 12 and iPhone 12 Mini). They were unveiled at an Apple Event in Apple Park in Cupertino, California on September 14, 2021, alongside the higher priced iPhone 13 Pro and iPhone 13 Pro Max flagships. Pre-orders for the iPhone 13 and iPhone 13 Mini began on September 17, 2021. They became available on September 24, 2021",
            imageURL:"https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Apple_iPhone_4_Bumper.jpg/640px-Apple_iPhone_4_Bumper.jpg",
            latitude: 20.844912,
            longitude: 106.688087,
            isFavorite: true,
            count: 3
        )
    ]
    func getProducts() -> [Product]{
        return products
    }
    func updateProduct(id: Int, updatedProduct:Product) {
        var product:Product? = products.filter { $0.id == id
        }.first
        if var product = product {
            product.name = updatedProduct.name.count == 0 ? product.name : updatedProduct.name
            product.title = updatedProduct.title.count == 0 ? product.title : updatedProduct.title
            product.description = updatedProduct.description?.count == 0 ? product.description : updatedProduct.description
            product.imageURL = updatedProduct.imageURL?.count == 0 ? product.imageURL : updatedProduct.imageURL
            product.latitude = updatedProduct.latitude
            product.longitude = updatedProduct.longitude
            product.isFavorite = updatedProduct.isFavorite
            product.count = updatedProduct.count
            
        }
        
    }
}
