//
//  UILabel+.swift
//  DoorDash
//
//  Created by Morris Lam on 7/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit

// Beginning implementation of design system here
extension UILabel {
    enum Theme {
        case title
        case detail
    }

    convenience init(theme: Theme) {
        self.init()

        // Dynamic fonts should be used here
        switch theme {
        case .title:
            self.font = UIFont(name: "HelveticaNeue-Medium", size: 20)

        case .detail:
            self.font = UIFont(name: "HelveticaNeue", size: 16)
        }
    }

    func styleWith(
        alignment: NSTextAlignment = .left,
        color: UIColor = .black)
    {
        self.textAlignment = alignment
        self.textColor = color
    }
}
