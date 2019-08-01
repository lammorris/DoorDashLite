//
//  Restaurant.swift
//  DoorDash
//
//  Created by Morris Lam on 7/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import Foundation

struct Restaurant: Codable {
    let deliveryTime: String
    let coverImage: URL
    let description: String
    let id: Int
    let deliveryFee: Double
    let name: String

    enum CodingKeys: String, CodingKey {
        case deliveryTime = "asap_time"
        case coverImage = "cover_img_url"
        case description
        case id
        case deliveryFee = "delivery_fee"
        case name

    }
}
