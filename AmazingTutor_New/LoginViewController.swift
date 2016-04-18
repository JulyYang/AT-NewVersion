//
//  ViewController.swift
//  AmazingTutor
//
//  Created by apple on 2016/3/29.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, GIDSignInUIDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
//        print("a")
//    }
//    
//    // Present a view that prompts the user to sign in with Google
//    func signIn(signIn: GIDSignIn!, presentViewController viewController: UIViewController!) {
//        self.presentViewController(viewController, animated: true, completion: nil)
//        print("b")
//    }
//    
//    // Dismiss the "Sign in with Google" view
//    func signIn(signIn: GIDSignIn!, dismissViewController viewController: UIViewController!) {
//        self.dismissViewControllerAnimated(true, completion: nil)
//    }

}

