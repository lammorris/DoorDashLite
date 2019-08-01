//
//  FavoritesViewController.swift
//  DoorDash
//
//  Created by Morris Lam on 8/1/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import Foundation
import UIKit

final class FavoritesViewController: BaseViewController<BaseView> {

    // MARK: - Properties

    // MARK: - Initialization

    override init() {
        super.init()

        tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(named: .starTab), selectedImage: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
