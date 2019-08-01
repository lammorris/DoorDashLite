//
//  ImageName.swift
//  DoorDash
//
//  Created by Morris Lam on 7/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit

enum ImageName: String, Codable {
    case navAddress = "nav-address"
    case starWhite = "star-white"
    case exploreTab = "tab-explore"
    case starTab = "tab-star"
}

extension UIImage {
    convenience init?(named name: ImageName) {
        self.init(named: name.rawValue)
    }
}
