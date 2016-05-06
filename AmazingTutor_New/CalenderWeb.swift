//
//  CalenderWeb.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/30.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import STZPopupView

class CalenderWeb: UIViewController, alertSheetDelegate{
    
    let BookingAlertView = BookingSuccess.instanceFromNib()
    //    BookingAlertView.
    
    func bookingConfirm(){
        presentPopupView(BookingAlertView)
    }
    
    func fadeOut(){
//        dismissPopupView()
    }
    
    @IBOutlet weak var BaseView: UIView!
    @IBOutlet weak var CalenderWebView: UIWebView!
    @IBOutlet weak var DatePicker: UIDatePicker!
    @IBAction func BooknowButton(sender: AnyObject) {
        bookingConfirm()
    }
    @IBAction func CancelWebView(sender: AnyObject) {
        backToMainPage()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = true
        let SignInurl = NSURL(string: "http://www.books.com.tw/")
        let request = NSURLRequest(URL: SignInurl!)
        CalenderWebView.loadRequest(request)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }
    
    func backToMainPage(){
        dismissViewControllerAnimated(true, completion: nil)
    }
}
