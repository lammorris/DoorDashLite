//
//  BaseTableViewCell.swift
//  DoorDash
//
//  Created by Morris Lam on 7/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell, Constructable {

    // MARK: Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .white
        selectionStyle = .none

        construct()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Construction

    func construct() {
        constructSublayerHierarchy()
        constructSubviewHierarchy()
        constructSubviewLayoutConstraints()
    }

    func constructSublayerHierarchy() { }
    func constructSubviewHierarchy() { }
    func constructSubviewLayoutConstraints() { }
}
