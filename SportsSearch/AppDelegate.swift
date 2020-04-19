//
//  AppDelegate.swift
//  SportsSearch
//
//  Created by Shi Li on 2020/4/17.
//  Copyright © 2020 wanglei. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appManager = AppManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        initJpush(launchOptions)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = LaunchViewController.instance()
        window?.makeKeyAndVisible()
        
        return true
    }

}

