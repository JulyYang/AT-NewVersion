//
//  HangoutAlert.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/5/2.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

protocol goToHangoutAlertDelegate: class {
    func goHangout()
    //    func HangoutButton()
}

class HangoutAlert: UIView {
    weak var HangoutAlert: goToHangoutAlertDelegate?
    
    @IBOutlet weak var HangoutBtWebvVew: UIWebView!
    @IBAction func goToHangoutBt(sender: AnyObject) {
//        HangoutAlert?.goHangout(NSURL(string: "http://plok740122.com/hangout.html")!, webview: HangoutBtWebvVew){
//         let Hangurl = NSURL(string:"http://plok740122.com/hangout.html")
//        let request = NSURLRequest(URL: Hangurl!)
//        HangoutBtWebvVew.loadRequest(request)
//
//        }
    }
    
}
