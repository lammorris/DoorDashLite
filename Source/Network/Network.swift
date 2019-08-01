//
//  Network.swift
//  DoorDash
//
//  Created by Morris Lam on 7/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import Foundation

class Network {
    static let shared = Network()
    static let domain = "https://api.doordash.com"

    let session = URLSession(configuration: URLSessionConfiguration.default)

    let restaurantService = DoorDash.Restaurants_v1.RestaurantsService()
}
