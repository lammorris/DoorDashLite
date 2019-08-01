//
//  Restaurant.swift
//  DoorDash
//
//  Created by Morris Lam on 7/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import Foundation

struct Restaurant: Codable {
    let business: Business
    let coverImage: URL
    let deliveryFee: Double
    let deliveryTime: Int?
    let description: String
    let id: Int

    enum CodingKeys: String, CodingKey {
        case business
        case coverImage = "cover_img_url"
        case deliveryFee = "delivery_fee"
        case deliveryTime = "asap_time"
        case description
        case id

    }
}

struct Business: Codable {
    let id: Int
    let name: String
}
