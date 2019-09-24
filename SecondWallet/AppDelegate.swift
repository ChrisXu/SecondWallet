//
//  AppDelegate.swift
//  SecondWallet
//
//  Created by Chris Xu on 2019/9/7.
//  Copyright © 2019 chrisxu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let window = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let carListViewController = CardListViewController()
        let navigationController = UINavigationController(rootViewController: carListViewController)
        navigationController.isNavigationBarHidden = true
        window.rootViewController = navigationController
        
        window.makeKeyAndVisible()
        
        return true
    }
}

