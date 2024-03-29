//
//  MapViewController.swift
//  DoorDash
//
//  Created by Morris Lam on 7/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import CoreLocation
import MapKit
import UIKit

final class MapViewController: BaseViewController<MapView> {

    // MARK: - Properties

    private var doordashProvider: String? // TODO
    private var coordinator: Coordinator?
    private var locationManager: CLLocationManager?
    private var currentLocation: CLLocation?

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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        locationManager?.requestWhenInUseAuthorization()
        locationManager?.startUpdatingLocation()
    }

    // MARK: - Private Methods

    private func setup() {
        title = "Choose an Address"
        rootView.confirmationButton.addTarget(self, action: #selector(didConfirm), for: .touchUpInside)

        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager?.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        }

        rootView.delegate = self
    }

    private func getPlaceMark(location: CLLocation, completion: @escaping (CLPlacemark) -> Void) {
        let geocoder = CLGeocoder()

        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            guard error == nil else {
                // TODO: Logging
                assertionFailure("Reverse location lookup returned error")
                return
            }

            guard let closestPlaceMark = placemarks?.first else { return }

            completion(closestPlaceMark)
        }
    }

    // MARK: - Actions

    @objc private func didConfirm() {
        guard
            let navigationController = navigationController,
            let currentLocation = currentLocation
        else {
            return
        }

        let coordinate = Coordinate(coordinate: currentLocation)
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

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        currentLocation = location

        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

        manager.stopUpdatingLocation()

        getPlaceMark(location: location) { [weak self] in
            guard let strongSelf = self else { return }

            strongSelf.rootView.update(region: region, placemark: $0, shouldAnnotate: false)
        }
    }
}

extension MapViewController: MapViewDelegate {
    func mapView(_ view: MapView, centerDidChange coordinate: CLLocationCoordinate2D) {
        let newLocation = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        currentLocation = newLocation

        getPlaceMark(location: newLocation) { [weak self] in
            guard let strongSelf = self else { return }

            strongSelf.rootView.update(placemark: $0, shouldAnnotate: true)
        }
    }
}
