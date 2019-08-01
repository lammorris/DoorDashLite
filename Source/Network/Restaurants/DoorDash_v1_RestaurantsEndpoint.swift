//
// DoorDash_v1_RestaurantsEndpoint.swift
//  DoorDash
//
//  Created by Morris Lam on 7/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

extension DoorDash.Restaurants_v1 {
    enum RestaurantsEndpoint: Endpoint {
        case storeSearch(longitude: Double, latitude: Double)

        var httpMethod: HTTPMethod {
            switch self {
            case .storeSearch: return .get
            }
        }

        var validStatusCodes: [Int] { return [200] }

        func path() throws -> String {
            switch self {
            case .storeSearch: return "/v1/store_search/"
            }
        }

        func queryParameters() throws -> QueryParameters {
            struct QueryKey {
                static let longitude = "lng"
                static let latitude = "lat"
            }

            var queryParameters: QueryParameters = [:]

            switch self {
            case .storeSearch(let longitude, let latitude):
                queryParameters[QueryKey.longitude] = longitude.description
                queryParameters[QueryKey.latitude] = latitude.description
            }

            return queryParameters
        }

        func headers() throws -> [Header.Field : Header.Value] {
            switch self {
            case .storeSearch: return [:]
            }
        }

        func body() throws -> Body? {
            switch self {
            case .storeSearch: return nil
            }
        }
    }
}
