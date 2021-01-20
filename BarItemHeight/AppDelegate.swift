//
//  AppDelegate.swift
//  BarItemHeight
//
//  Created by WillowRivers on 2021/1/8.
//

import UIKit
import WebKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.frame = UIScreen.main.bounds
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        
        let vc1 = VC1()
        let nav1 = UINavigationController(rootViewController: vc1)
        nav1.tabBarItem = UITabBarItem(title: "first", image: UIImage(named: "bar1_normal"), selectedImage: UIImage(named: "bar1_selected"))
        
        let vc2 = VC2()
        let nav2 = UINavigationController(rootViewController: vc2)
        nav2.tabBarItem = UITabBarItem(title: "second", image: UIImage(named: "bar2_normal"), selectedImage: UIImage(named: "bar2_selected"))
        
        let tab = UITabBarController()
        tab.viewControllers = [nav1, nav2]
//        set UI.storedTabBarHeight
        UI.storedTabBarHeight = tab.tabBar.frame.height
        window?.rootViewController = tab
        
        return true
    }



}

