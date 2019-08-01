//
//  RestaurantCell.swift
//  DoorDash
//
//  Created by Morris Lam on 7/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit
import SDWebImage

final class RestaurantCell: BaseTableViewCell {

    private struct Layout {
        static let margin: CGFloat = 20
        static let detailSpacing: CGFloat = 4
        static let imageHeight: CGFloat = 75
        static let imageWidth: CGFloat = UIScreen.main.bounds.width / 4
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
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit

            return imageView
        }()

        detailStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = Layout.detailSpacing
            stackView.distribution = .equalSpacing

            return stackView
        }()

        titleLabel = {
            return UILabel(theme: .title)
        }()

        typeLabel = {
            let label = UILabel(theme: .detail)
            label.styleWith(color: .lightGray)

            return label
        }()

        deliveryStackView = {
            let stackView = UIStackView()
            stackView.distribution = .fillProportionally

            return stackView
        }()

        deliveryChargeLabel = {
            let label = UILabel()
            label.styleWith(color: .darkGray)

            return label
        }()

        deliveryTimeLabel = {
            let label = UILabel()
            label.styleWith(alignment: .right, color: .darkGray)

            return label
        }()

        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
            imgView.topAnchor.constraint(equalTo: topAnchor, constant: Layout.margin),
            imgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.margin),
            imgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Layout.margin),
            imgView.widthAnchor.constraint(equalToConstant: Layout.imageWidth),
            imgView.heightAnchor.constraint(equalToConstant: Layout.imageHeight),

            detailStackView.topAnchor.constraint(equalTo: topAnchor, constant: Layout.margin),
            detailStackView.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: Layout.margin),
            detailStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Layout.margin),
            detailStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Layout.margin),
        ])
    }

    // MARK: - Methods

    func update(restaurant: Restaurant) {
        imgView.sd_setImage(with: restaurant.coverImage)
        titleLabel.text = restaurant.business.name
        typeLabel.text = restaurant.description
        deliveryChargeLabel.text = restaurant.deliveryFee == 0 ? "Free Delivery" : "$ \(restaurant.deliveryFee.description) delivery"
        deliveryTimeLabel.text = "\(restaurant.deliveryTime ?? 0) min"
    }
}
