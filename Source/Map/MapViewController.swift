//
//  MapViewController.swift
//  DoorDash
//
//  Created by Morris Lam on 7/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit

final class MapViewController: BaseViewController<MapView> {

    // MARK: - Properties

    private var doordashProvider: String? // TODO
    private var coordinator: Coordinator?

    // MARK: - Initialization

    override init() {
        super.init()

        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setup()
    }

    // MARK: - Methods

    // MARK: - Private Methods

    private func setup() {
        title = "Choose an Address"
        rootView.confirmationButton.addTarget(self, action: #selector(didConfirm), for: .touchUpInside)
    }

    // MARK: - Actions

    @objc private func didConfirm() {
        guard let navigationController = navigationController else { return }

        let coordinate = Coordinate(longitude: -122.139956, latitude: 37.42274)
        let exploreCoordinator = ExploreCoordinator(navigationController: navigationController, coordinate: coordinate)
        exploreCoordinator.delegate = self
        self.coordinator = exploreCoordinator

        exploreCoordinator.start()
    }
}

extension MapViewController: ExploreCoordinatorDelegate {
    func exploreCoordinatorDidComplete(_ coordinator: ExploreCoordinator) {
        navigationController?.popToRootViewController(animated: true)
        self.coordinator = nil
    }
}
