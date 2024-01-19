//
//  AppDelegate.swift
//  MVVM(Study APP)
//
//  Created by Александр Андреев on 10.01.2024.
//

import UIKit
//changed
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let window = UIWindow(frame: UIScreen.main.bounds)// what difference between bunds and ...?
        let navigationController = UINavigationController(rootViewController: MainViewController())
        window.rootViewController = navigationController
        
        window.makeKeyAndVisible()
        
        self.window = window
        return true
    }
}

