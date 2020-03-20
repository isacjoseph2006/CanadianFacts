//
//  AppDelegate.swift
//  Canada
//
//  Created by Isac Joseph on 20/03/20.
//  Copyright © 2020 Isac Joseph. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        // Override point for customization after application launch.
        showInitialViewController()
        return true
    }

    func showInitialViewController()
    {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let rootViewController = ListingViewController()
        rootViewController.view.backgroundColor = UIColor.green
        let navController = UINavigationController(rootViewController: rootViewController)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}

