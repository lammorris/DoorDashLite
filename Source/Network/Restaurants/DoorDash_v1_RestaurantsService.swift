//
//  DoorDash_v1_RestaurantsService.swift
//  DoorDash
//
//  Created by Morris Lam on 7/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import Foundation

extension DoorDash.Restaurants_v1 {
    struct RestaurantsService: DoorDash_v1_RestaurantsProvider {
        @discardableResult
        func storeSearch(
            longitude: Double,
            latitude: Double,
            queue: DispatchQueue = .main,
            completion: @escaping ([Restaurant]) -> Void)
            -> URLRequest
        {
            let endpoint = RestaurantsEndpoint.storeSearch(longitude: longitude, latitude: latitude)

            var components = URLComponents(string: Network.domain)
            components?.path = try! endpoint.path()
            components?.queryItems = try? endpoint.queryParameters().queryItems

            guard let url = components?.url else {
                assertionFailure("No URL found.")

                // TODO: Better error handling
                return URLRequest(url: URL(string: Network.domain)!)
            }

            let task = Network.shared.session.dataTask(with: url) { (data, response, error) in
                queue.async { completion([]) }
            }

            task.resume()

            return URLRequest(url: url)
        }
    }
}
