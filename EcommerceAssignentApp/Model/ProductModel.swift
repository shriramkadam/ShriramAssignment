//
//  ProductModel.swift
//  EcommerceAssignentApp
//
//  Created by Shriram Kadam on 10/12/22.
//

import SwiftUI
import Foundation
import SwiftUI

struct Product {
    var id:String
    var image:Image
    var title:String
    var price:Double
    var message:String
    var reviews:[Review]
    
    var ratingCount:Double {
        get {
            reviews.reduce(0) { (res, review) -> Double in
                res + review.ratingCount
            }
        }
    }
}

struct Review {
    var name:String
    var ratingCount:Double
    var brand:String
}

