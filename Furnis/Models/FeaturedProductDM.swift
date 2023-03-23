//
//  FeaturedProductDM.swift
//  Furnis
//
//  Created by user1 on 16/03/23.
//

import Foundation

struct FeaturedProductModel {
    let image: String
    let producttName: String
    let oldPrice: String
    let currentPirce: String
}

let featuredProductData = [
    FeaturedProductModel(image: "chair", producttName: "Chair Plus", oldPrice: "120", currentPirce: "111"),
    FeaturedProductModel(image: "chair", producttName: "Ultra Chair", oldPrice: "110", currentPirce: "133"),
    FeaturedProductModel(image: "chair", producttName: "Max Ultra", oldPrice: "110", currentPirce: "170"),
    FeaturedProductModel(image: "chair", producttName: "Optimus Prime", oldPrice: "100", currentPirce: "150"),
    FeaturedProductModel(image: "chair", producttName: "Hello MF", oldPrice: "90", currentPirce: "110"),
    FeaturedProductModel(image: "chair", producttName: "Samuel L Jackson", oldPrice: "95", currentPirce: "120")
]
