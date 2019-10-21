//
//  AppDelegate.swift
//  SoBoon
//
//  Created by CHOMINJI on 07/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        GeneralHelper.sharedInstance.setup()
        
        return true
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        return true
    }

}

// MARK: - ViewController

extension AppDelegate {
    
    func creatBaseViewController() {
        self.dismissPresentViewController()
        
        let vc: BaseTabBarViewController = GeneralHelper.sharedInstance.makeTabBarViewController(sb: "Base", vc: "BaseTabBarViewController")

        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }
    
    func dismissPresentViewController() {
        if (self.window?.rootViewController?.presentedViewController != nil) {
            self.window?.rootViewController?.dismiss(animated: false, completion: nil)
        }
    }
    
}


