//
//  SignInWebPage.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/21.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

class SignInWebPage: UIViewController {

    @IBAction func CancelSignIn(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet weak var SignWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let webView = WKWebView(frame: self.SignWebView.bounds)
//        self.SignWebView.addSubview(webView)
        
        let SignInurl = NSURL(string: "https://www.google.com")
        let request = NSURLRequest(URL: SignInurl!)
        SignWebView.loadRequest(request)
        
//        let SignInurl = NSURL(string: "http://www.google.com")
//        UIApplication.sharedApplication().openURL(SignInurl!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
