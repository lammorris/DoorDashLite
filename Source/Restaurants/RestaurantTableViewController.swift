//
//  RestaurantTableViewController.swift
//  DoorDash
//
//  Created by Morris Lam on 7/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import Foundation
import UIKit

protocol RestaurantTableViewControllerDelegate: AnyObject {
    func restaurantTableViewControllerDidComplete(_ viewController: UITableViewController)
}

final class RestaurantTableViewController: UITableViewController {

    // MARK: - Properties

    private let reuseIdentifier = "RestaurantCell"
    private let restaurants: [Restaurant]

    weak var delegate: RestaurantTableViewControllerDelegate?

    // MARK: - Initialization

    init(restaurants: [Restaurant]) {
        self.restaurants = restaurants

        super.init(nibName: nil, bundle: nil)

        tableView.register(RestaurantCell.self, forCellReuseIdentifier: reuseIdentifier)

        tabBarItem = UITabBarItem(title: "Explore", image: UIImage(named: .exploreTab), selectedImage: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! RestaurantCell

        cell.update(restaurant: restaurants[indexPath.row])

        return cell
    }

    // MARK: - Private Methods

    // MARK: - Actions
}
