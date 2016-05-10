//
//  HangoutAlert.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/5/2.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

protocol goToHangoutAlertDelegate: class {
    func goToHangoutAlert()
}

class HangoutAlert: UIView, UIGestureRecognizerDelegate, UIWebViewDelegate{
    
    weak var HAlert: goToHangoutAlertDelegate?
    
    @IBOutlet weak var BaseView: UIView!
    @IBOutlet weak var AmazingTitle: UILabel!
    @IBOutlet weak var TutorTitle: UILabel!
    @IBOutlet weak var SubTitle: UILabel!
    @IBOutlet weak var HangoutBtWebView: UIWebView!
    @IBOutlet weak var GoToHangout: UILabel!

    // 將xib上的item load進來view裡
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "HangoutAlert", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! UIView
    }
    
    override func awakeFromNib() {
        let Hangurl = NSURL(string: "http://plok740122.com/hangout.html")
        let request = NSURLRequest(URL: Hangurl!)
        HangoutBtWebView.loadRequest(request)
        HangoutBtWebView.alpha = 0.02
        HangoutBtWebView.delegate = self
        GoToHangout.layer.cornerRadius = 20.0
        GoToHangout.layer.masksToBounds = true
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print("request url: \(request.URL?.host)")
        if request.URL?.host == "videochat" {
//            let StarRatingStoryboard = UIStoryboard(name: "Rating", bundle: nil)
//                    let StarRatingController = StarRatingStoryboard.instantiateViewControllerWithIdentifier("StarRating")
//                    self.window!.rootViewController = StarRatingController

            
        }
        return true
    }
}

