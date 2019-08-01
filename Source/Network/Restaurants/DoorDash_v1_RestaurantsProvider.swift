//
//  DoorDash_v1_RestaurantsProvider.swift
//  DoorDash
//
//  Created by Morris Lam on 7/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import Foundation

protocol DoorDash_v1_RestaurantsProvider {
    @discardableResult
    func storeSearch(
        longitude: Double,
        latitude: Double,
        queue: DispatchQueue,
        completion: @escaping ([Restaurant]) -> Void)
    -> URLRequest
}

