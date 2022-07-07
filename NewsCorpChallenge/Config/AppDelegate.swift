//
//  AppDelegate.swift
//  NewsCorpChallenge
//
//  Created by Richard Julca Amaro on 5/07/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupRootController()
        return true
    }
    
    /// Use this function to setup the rootController with its dependecies
    func setupRootController() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        let rootController = UINavigationController(rootViewController: PhotoPresenterRouter.createModule())
        self.window?.rootViewController = rootController
        self.window?.makeKeyAndVisible()
    }
    
}

