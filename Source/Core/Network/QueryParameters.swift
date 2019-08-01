//
//  QueryParameters.swift
//  CardDeck
//
//  Created by Morris Lam on 7/29/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import Foundation

struct QueryParameters: ExpressibleByDictionaryLiteral {
    /// The key type of the dictionary literal is a `String`.
    typealias Key = String

    /// The value type of the dictionary literal is a `String`.
    typealias Value = String

    private(set) var parameters: [(String, String)] = []

    /// Returns the internal query parameters as an array of `URLQueryItem` instances.
    var queryItems: [URLQueryItem] {
        return parameters.map(URLQueryItem.init)
    }

    /// Creates a `QueryParameters` instance from the specified tuple array of key-value pairs.
    ///
    /// - Parameter elements: The key-value pairs to store as query parameters.
    init(dictionaryLiteral elements: (String, String)...) {
        parameters.append(contentsOf: elements)
    }

    // MARK: Accessors

    /// Gets-sets the parameter value for the specified key.
    ///
    /// If there are multiple values for the specified key, the values are returned as a comma-separated list in
    /// the order in which they were set.
    ///
    /// - Parameter key: The parameter key to get-set the value for.
    ///
    /// - Complexity: O(1) on set, O(n^2) on get in worst case.
    public subscript(key: String) -> String? {
        get {
            let values = parameters.filter { $0.0 == key }.map { $0.1 }
            guard !values.isEmpty else { return nil }

            return values.joined(separator: ", ")
        }
        set {
            if let newValue = newValue {
                parameters.append((key, newValue))
            } else {
                var indices: [Int] = []

                for (index, parameter) in parameters.enumerated() where parameter.0 == key {
                    indices.append(index)
                }

                for index in indices.reversed() {
                    parameters.remove(at: index)
                }
            }
        }
    }
}
