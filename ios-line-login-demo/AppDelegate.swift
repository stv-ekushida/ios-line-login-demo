//
//  AppDelegate.swift
//  ios-line-login-demo
//
//  Created by Eiji Kushida on 2017/06/22.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }


    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return LineSDKLogin.sharedInstance().handleOpen(url)
    }

}

