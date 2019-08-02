//
//  MapView.swift
//  DoorDash
//
//  Created by Morris Lam on 7/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit
import MapKit

protocol MapViewDelegate: AnyObject {
    func mapView(_ view: MapView, centerDidChange coordinate: CLLocationCoordinate2D)
}

final class MapView: BaseView {

    private struct Layout {
        static let infoHeight: CGFloat = 50
    }

    // MARK: - Properties

    private let map: MKMapView
    private let addressLabel: UILabel
    private let infoStack: UIStackView

    let confirmationButton: UIButton

    weak var delegate: MapViewDelegate?

    // MARK: - Initialization

    override init(frame: CGRect) {
        map = {
            let map = MKMapView(frame: .zero)
            map.showsUserLocation = true
            map.userTrackingMode = .follow

            return map
        }()

        addressLabel = {
            let label = UILabel(theme: .detail)
            label.styleWith(alignment: .center, color: .lightGray)

            return label
        }()

        infoStack = {
            let stackView = UIStackView()
            stackView.axis = .vertical

            return stackView
        }()

        confirmationButton = {
            let button = UIButton()
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = UIColor.doorDashRed
            button.setTitle("Confirm", for: .normal)

            return button
        }()

        super.init(frame: frame)

        map.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func constructSubviewHierarchy() {
        super.constructSubviewHierarchy()

        infoStack.addArrangedSubview(addressLabel)
        infoStack.addArrangedSubview(confirmationButton)

        addSubview(map)
        addSubview(infoStack)
    }

    override func constructSubviewLayoutConstraints() {
        super.constructSubviewLayoutConstraints()

        map.translatesAutoresizingMaskIntoConstraints = false
        infoStack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            map.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            map.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            map.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),

            addressLabel.heightAnchor.constraint(equalToConstant: Layout.infoHeight),
            confirmationButton.heightAnchor.constraint(equalToConstant: Layout.infoHeight),

            infoStack.topAnchor.constraint(equalTo: map.bottomAnchor),
            infoStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            infoStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            infoStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    // MARK: - Methods

    func update(region: MKCoordinateRegion? = nil, placemark: CLPlacemark) {
        if let region = region {
            map.setRegion(region, animated: true)

            let annotation = MKPointAnnotation()
            annotation.coordinate = region.center
        }

        addressLabel.text = [placemark.subThoroughfare, placemark.thoroughfare, placemark.locality].compactMap({ $0 }).joined(separator: " ")
    }
}

extension MapView: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        mapView.removeAnnotations(mapView.annotations)

        let annotation = MKPointAnnotation()
        annotation.coordinate = mapView.region.center

        delegate?.mapView(self, centerDidChange: mapView.region.center)

        mapView.addAnnotation(annotation)
    }
}
