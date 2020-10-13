//
//  AppDelegate.swift
//  AppEventCount
//
//  Created by Janusz Polowczyk on 11/10/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var viewController: ViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        viewController = window?.rootViewController as? ViewController
        viewController?.launchCount += 1
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        viewController?.willResignCount += 1
    }
    
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        viewController?.enterBackgroundCount += 1
    }
    
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        viewController?.enterForegroundCount += 1
    }
    
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        viewController?.becomeActiveCount += 1
        viewController?.updateView()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        viewController?.willTerminateCount += 1
    }
    
}
