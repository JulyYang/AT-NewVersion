//
//  AppDelegate.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/17.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

// Google送審會遇到問題，login拿掉
//, GIDSignInDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Crashlytics install
        Fabric.with([Crashlytics.self])
        
        UINavigationBar.appearance().titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "Helvetica", size: 20)!]
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        
        // Facebook signin
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AppDelegate.fbTokenChangeNoti(_:)), name: FBSDKAccessTokenDidChangeNotification, object: nil)
        print("nm")
        
        // Initialize Google sign-in
//        var configureError: NSError?
//        GGLContext.sharedInstance().configureWithError(&configureError)
//        assert(configureError == nil, "Error configuring Google services: \(configureError)")
//        GIDSignIn.sharedInstance().delegate = self
        
        return FBSDKApplicationDelegate.sharedInstance().application(application,didFinishLaunchingWithOptions: launchOptions)
    }
    
    
    func fbTokenChangeNoti (noti:NSNotification){
        if FBSDKAccessToken.currentAccessToken() != nil{
            
            let LoginStoryboard = UIStoryboard(name: "Login", bundle: nil)
            let LoginController = LoginStoryboard.instantiateViewControllerWithIdentifier("LoginPage")
            let RootStoryboard = UIStoryboard(name: "TList", bundle: nil)
            let RootController = RootStoryboard.instantiateViewControllerWithIdentifier("MainTabBarController")
            
            print("token: \(FBSDKAccessToken.currentAccessToken().tokenString)")
            print("jk")
            
            if self.window != nil{
                self.window!.rootViewController = RootController
            }else if FBSDKAccessToken.currentAccessToken() == nil{
                self.window!.rootViewController = LoginController
                
                print("nok")
            }
        }
    }
    
    // Facebook or Google (Google拿掉)
    func application(application: UIApplication, openURL url: NSURL,sourceApplication: String?, annotation: AnyObject) -> Bool {
        print("s")
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
//            || GIDSignIn.sharedInstance().handleURL(url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    // Google (和FB login合併時這段不用)
//    @available(iOS 9.0, *)
//    func application(application: UIApplication, openURL url: NSURL, options: [String: AnyObject]) -> Bool {
//        return GIDSignIn.sharedInstance().handleURL(url, sourceApplication: options[UIApplicationOpenURLOptionsSourceApplicationKey] as? String, annotation: options[UIApplicationOpenURLOptionsAnnotationKey])
//    }
    
//    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
//        if (error == nil) {
//            // Perform any operations on signed in user here.
//            let userId = user.userID                  // For client-side use only!
//            let idToken = user.authentication.idToken // Safe to send to the server
//            let fullName = user.profile.name
////            let givenName = user.profile.givenName
////            let familyName = user.profile.familyName
//            let email = user.profile.email
//            
//            print("\(userId)")
//            print("\(idToken)")
//            print("\(fullName)")
//            print("\(email)")
//            
//        } else {
//            print("\(error.localizedDescription)")
//        }
//    }

//    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!, withError error: NSError!) {
//        // Perform any operations when the user disconnects from app here.
//    }
    
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