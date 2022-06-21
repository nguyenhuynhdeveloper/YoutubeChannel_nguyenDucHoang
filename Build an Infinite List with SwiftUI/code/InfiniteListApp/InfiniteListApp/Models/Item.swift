//
//  Item.swift
//  InfiniteListApp
//
//  Created by Nguyen Duc Hoang on 21/06/2022.
//

import Foundation
import Foundation
struct Item:Identifiable, Codable, Equatable {
    var name:String = ""
    var id: String {
        //implemented property(function)
        //return "\(name) - \(isSelected)"
        //return name
        name
    }
    /*
    static func == (productA: Product, productB: Product) -> Bool {
            return
                productA.name == productB.name
                    && productA.tagline == productB.tagline
        }
     */
}
