//
//  MapView.swift
//  DoorDash
//
//  Created by Morris Lam on 7/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit

final class MapView: BaseView {

    // MARK: - Properties

    let confirmationButton: UIButton

    // MARK: - Initialization

    override init(frame: CGRect) {
        confirmationButton = {
            let button = UIButton()
            button.setTitleColor(.black, for: .normal)
            button.setTitle("Confirm", for: .normal)

            return button
        }()

        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    override func constructSubviewHierarchy() {
        super.constructSubviewHierarchy()

        addSubview(confirmationButton)
    }

    override func constructSubviewLayoutConstraints() {
        super.constructSubviewLayoutConstraints()

        confirmationButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            confirmationButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            confirmationButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            confirmationButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            confirmationButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    // MARK: - Private Methods
}
