//
//  CoordinateTests.swift
//  DoorDashTests
//
//  Created by Morris Lam on 8/1/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

@testable import DoorDash
import MapKit
import XCTest

final class CoordinateTests: XCTestCase {

    // MARK: - Properties

    // MARK: - Methods

    func testThatCoordinateCanInitialize() {
        // Given
        let location = CLLocation(latitude: 1, longitude: 1)

        // When
        let coordinate = Coordinate(coordinate: location)

        // Then
        XCTAssertEqual(coordinate.latitude, location.coordinate.latitude)
        XCTAssertEqual(coordinate.longitude, location.coordinate.longitude)
    }
}
