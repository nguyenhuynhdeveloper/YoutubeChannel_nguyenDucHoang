//
//  Product.swift
//  MyApp
//
//  Created by Nguyen Duc Hoang on 27/03/2022.
//

import Foundation
import SwiftUI
import CoreLocation


class Product {
    var id: Int = 0
    var name: String = ""
    var title: String = ""
    var description:String?
    var imageURL: String?
    //AsyncImage(ios 15)
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    //Row / ProductListItem
    var isFavorite: Bool = false
    var count: Int = 0
    init(id:Int,
         name:String,
         title: String,
         description:String?,
         imageURL: String?,
         latitude:Double,
         longitude: Double,
         isFavorite: Bool,
         count: Int         
    ) {
        self.id = id
        self.name = name
        self.title = title
        self.description = description
        self.imageURL = imageURL
        self.latitude = latitude
        self.longitude = longitude
        self.isFavorite = isFavorite
        self.count = count
    }
}
