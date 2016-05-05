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

class HangoutAlert: UIView {
    
    weak var HAlert: goToHangoutAlertDelegate?
    
    @IBOutlet weak var BaseView: UIView!
    @IBOutlet weak var AmazingTitle: UILabel!
    @IBOutlet weak var TutorTitle: UILabel!
    @IBOutlet weak var SubTitle: UILabel!
    @IBOutlet weak var HangoutBtWebView: UIWebView!
    @IBAction func goToHangoutBt(sender: GoToHangout) {
        let Hangurl = NSURL(string: "http://plok740122.com/hangout.html")
        let request = NSURLRequest(URL: Hangurl!)
        HangoutBtWebView.loadRequest(request)
        }
    // 將xib上的item load進來view裡
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "HangoutAlert", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! UIView
    }
}

