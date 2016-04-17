//
//  AppDelegate.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/17.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Facebook signin
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AppDelegate.fbTokenChangeNoti(_:)), name: FBSDKAccessTokenDidChangeNotification, object: nil)
        return FBSDKApplicationDelegate.sharedInstance().application(application,didFinishLaunchingWithOptions: launchOptions)
    }
    
    func fbTokenChangeNoti (noti:NSNotification){
        if FBSDKAccessToken.currentAccessToken() != nil{
            
            let LoginStoryboard = UIStoryboard(name: "Login", bundle: nil)
            let LoginController = LoginStoryboard.instantiateViewControllerWithIdentifier("LoginPage")
            let RootStoryboard = UIStoryboard(name: "TList", bundle: nil)
            let RootController = RootStoryboard.instantiateViewControllerWithIdentifier("TListPage")
            
            if self.window != nil{
                self.window!.rootViewController = RootController
            }else if FBSDKAccessToken.currentAccessToken() == nil{
                self.window!.rootViewController = LoginController
            }
        }
    }
    
    func application(application: UIApplication, openURL url: NSURL,sourceApplication: String?, annotation: AnyObject) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }
}