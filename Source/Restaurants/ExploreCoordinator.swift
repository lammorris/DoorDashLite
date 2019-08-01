//
//  ExploreCoordinator.swift
//  DoorDash
//
//  Created by Morris Lam on 7/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import Foundation
import UIKit

protocol ExploreCoordinatorDelegate: AnyObject {
    func exploreCoordinatorDidComplete(_ coordinator: ExploreCoordinator)
}

final class ExploreCoordinator: Coordinator {

    // MARK: - Properties

    private let navigationController: UINavigationController
    private let coordinate: Coordinate
    private var restaurants: [Restaurant]?

    weak var delegate: ExploreCoordinatorDelegate?

    // MARK: - Initialization

    init(navigationController: UINavigationController, coordinate: Coordinate) {
        self.navigationController = navigationController
        self.coordinate = coordinate
    }

    // MARK: - Methods

    func start() {
        getRestaurants(longitude: coordinate.longitude, latitude: coordinate.latitude) { [weak self] restaurants in
            guard let strongSelf = self else { return }

            strongSelf.restaurants = restaurants

            let tabBarVC = LocatedTabBarController()
            let restaurantTableVC = RestaurantTableViewController(restaurants: restaurants)
            let favoritesVC = FavoritesViewController()

            tabBarVC.navigationDelegate = strongSelf

            tabBarVC.setViewControllers([restaurantTableVC, favoritesVC], animated: true)
            strongSelf.navigationController.pushViewController(tabBarVC, animated: true)
        }
    }

    // MARK: - Network

    private func getRestaurants(longitude: Double, latitude: Double, completion: @escaping ([Restaurant]) -> Void) {
        Network.shared.restaurantService.storeSearch(longitude: longitude, latitude: latitude, completion: completion)
    }
}

extension ExploreCoordinator: LocatedTabBarControllerDelegate {
    func locatedTabBarControllerDidComplete(_ viewController: LocatedTabBarController) {
        delegate?.exploreCoordinatorDidComplete(self)
    }
}
