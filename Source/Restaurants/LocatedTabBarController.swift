//
//  LocatedTabBarController.swift
//  DoorDash
//
//  Created by Morris Lam on 7/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit

protocol LocatedTabBarControllerDelegate: AnyObject {
    func locatedTabBarControllerDidComplete(_ viewController: LocatedTabBarController)
}

class LocatedTabBarController: UITabBarController {

    // MARK: - Properties

    weak var navigationDelegate: LocatedTabBarControllerDelegate?

    // MARK: - Initialization

    init() {
        super.init(nibName: nil, bundle: nil)

        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: .navAddress),
            style: .plain,
            target: self,
            action: #selector(back)
        )

        title = "DoorDash"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    @objc private func back() {
        navigationDelegate?.locatedTabBarControllerDidComplete(self)
    }
}
