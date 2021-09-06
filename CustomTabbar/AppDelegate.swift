//
//  AppDelegate.swift
//  CustomTabbar
//
//  Created by liuyaozong on 2021/9/6.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.\\
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = TabbarViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }



}

