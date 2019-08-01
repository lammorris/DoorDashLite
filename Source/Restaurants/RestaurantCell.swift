//
//  RestaurantCell.swift
//  DoorDash
//
//  Created by Morris Lam on 7/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit

final class RestaurantCell: BaseTableViewCell {

    private struct Layout {
        static let margin: CGFloat = 20
    }

    // MARK: - Properties

    private let imgView: UIImageView
    private let detailStackView: UIStackView
    private let titleLabel: UILabel
    private let typeLabel: UILabel
    private let deliveryStackView: UIStackView
    private let deliveryChargeLabel: UILabel
    private let deliveryTimeLabel: UILabel

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        imgView = {
            return UIImageView()
        }()

        detailStackView = {
            return UIStackView()
        }()

        titleLabel = {
            return UILabel()
        }()

        typeLabel = {
            return UILabel()
        }()

        deliveryStackView = {
            return UIStackView()
        }()

        deliveryChargeLabel = {
            return UILabel()
        }()

        deliveryTimeLabel = {
            return UILabel()
        }()

        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    override func constructSubviewHierarchy() {
        super.constructSubviewHierarchy()

        deliveryStackView.addArrangedSubview(deliveryChargeLabel)
        deliveryStackView.addArrangedSubview(deliveryTimeLabel)

        detailStackView.addArrangedSubview(titleLabel)
        detailStackView.addArrangedSubview(typeLabel)
        detailStackView.addArrangedSubview(deliveryStackView)

        addSubview(imgView)
        addSubview(detailStackView)
    }

    override func constructSubviewLayoutConstraints() {
        super.constructSubviewLayoutConstraints()

        imgView.translatesAutoresizingMaskIntoConstraints = false
        detailStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Layout.margin),
            imgView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Layout.margin),
            imgView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: Layout.margin),

            detailStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Layout.margin),
            detailStackView.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: Layout.margin),
            detailStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Layout.margin),
            detailStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: Layout.margin),
        ])
    }
}
