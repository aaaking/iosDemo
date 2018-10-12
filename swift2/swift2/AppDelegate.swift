//
//  AppDelegate.swift
//  swift2
//
//  Created by 周智慧 on 2018/9/29.
//  Copyright © 2018 周智慧. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //
        let tab = UITabBarController()
        
        let tab1 = Tab1()
        var image1 = UIImage.init(named: "tabs/tab1.png")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal);
        tab1.title = "Home"
        tab1.tabBarItem.image = image1
        let nav1 = UINavigationController(rootViewController: tab1)
        
        let tab2 = Tab2()
        let image2 = UIImage.init(named: "tab2.png")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        tab2.title = "Contacts"
        tab2.tabBarItem.image = image2
        let nav2 = UINavigationController(rootViewController: tab2)
        
        let tab3 = Tab3()
        tab3.title = "Discovery"
        let nav3 = UINavigationController(rootViewController: tab3)
        
        let tab4 = Tab4()
        tab4.title = "Me"
        let nav4 = UINavigationController(rootViewController: tab4)
        
//        tab.viewControllers = [nav1, nav2, nav3, nav4]
        tab.viewControllers = [nav1, tab2, tab3, tab4]
        
//        let nav = UINavigationController(rootViewController: tab)

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = tab//nav//
        return true
    }

    //从前台退到后台
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        print("------applicationWillResignActive-------")
    }

    //已经进入后台
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

