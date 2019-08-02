//
//  AppDelegate.swift
//  DoorDash
//
//  Created by Morris Lam on 7/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        UINavigationBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().tintColor = UIColor.doorDashRed
        UINavigationBar.appearance().isTranslucent = false

        UITabBar.appearance().tintColor = UIColor.doorDashRed

        return true
    }
}

