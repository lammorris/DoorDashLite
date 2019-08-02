//
//  Coordinate.swift
//  DoorDash
//
//  Created by Morris Lam on 7/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import MapKit

struct Coordinate {
    let longitude: Double
    let latitude: Double

    init(coordinate: CLLocation) {
        self.longitude = coordinate.coordinate.longitude
        self.latitude = coordinate.coordinate.latitude
    }
}
