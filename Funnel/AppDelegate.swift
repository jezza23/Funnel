//
//  AppDelegate.swift
//  Funnel
//
//  Created by Jeremy Irvine on 2/1/18.
//  Copyright © 2018 Bamboo Technologies. All rights reserved.
//

import UIKit
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        print(url)
        if((url.absoluteString.range(of: "funnel://") == nil)) {
            UserDefaults.standard.set(TWTRTwitter.sharedInstance().sessionStore.session()?.userID, forKey: "twt_key")
            UserDefaults.standard.synchronize()
            print("Called")
            return TWTRTwitter.sharedInstance().application(app, open: url, options: options)
        } else {
            // Handle Instagram
            let substring1 = url.absoluteString[url.absoluteString.index(url.absoluteString.startIndex, offsetBy: 9)...]
            UserDefaults.standard.set(substring1, forKey: "instaKey")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "closeSafari"), object: nil)
        }
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        TWTRTwitter.sharedInstance().start(withConsumerKey:"FUNuuHn0EJrbxqtx5MnwfTpRB", consumerSecret:"5zdkfRbmFtJbf07iwmV27gQvV0maKPU9OE5Pn7cAdOnfApTTDx")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

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

