//
//  AppDelegate.swift
//  FlexibleBoxExample
//
//  Created by jiasong on 2023/6/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.configureWindow()
        return true
    }

}

extension AppDelegate {
    
    fileprivate func configureWindow() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = ViewController()
        self.window?.makeKeyAndVisible()
    }
    
}
