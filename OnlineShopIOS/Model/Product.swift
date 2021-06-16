//
//  Product.swift
//  OnlineShopIOS
//
//  Created by Aleksandr Dorofeev on 6/4/21.
//

import Foundation

struct Product: Codable {
    let productId: Int
    let productTitle: String
    let productDescription: String
    let productCost: Float
    let productRaiting: Double
    let productImageName: String
    let categoryId: Int

    private enum CodingKeys: String, CodingKey {
        case productId = "id"
        case productTitle = "name"
        case productDescription = "description"
        case productCost = "price"
        case productRaiting = "rating"
        case productImageName = "imagePath"
        case categoryId
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        productId = try container.decode(Int.self, forKey: .productId)
        productTitle = try container.decode(String.self, forKey: .productTitle)
        productDescription = try container.decode(String.self, forKey: .productDescription)
        productCost = try container.decode(Float.self, forKey: .productCost)
        productRaiting = try container.decode(Double.self, forKey: .productRaiting)
        productImageName = try container.decode(String.self, forKey: .productImageName)
        categoryId = try container.decode(Int.self, forKey: .categoryId)
    }
}
