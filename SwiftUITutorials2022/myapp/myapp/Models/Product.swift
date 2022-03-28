//
//  Product.swift
//  MyApp
//
//  Created by Nguyen Duc Hoang on 27/03/2022.
//

import Foundation
import SwiftUI
import CoreLocation


struct Product {
    var id: Int
    var name: String
    var title: String
    var description:String?
    var imageURL: String?
    //AsyncImage(ios 15)
    var latitude: Double
    var longitude: Double
    //Row / ProductListItem
}
