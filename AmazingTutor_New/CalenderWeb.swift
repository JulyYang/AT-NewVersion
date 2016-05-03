//
//  CalenderWeb.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/30.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import STZPopupView

class CalenderWeb: UIViewController {
//, alertSheetDelegate{

    let BookingAlertView = BookingSuccess.instanceFromNib()
    @IBOutlet weak var CalenderWebView: UIWebView!
    @IBAction func BooknowButton(sender: AnyObject) {
        bookingConfirm()
    }
    @IBAction func CancelWebView(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = true
        let SignInurl = NSURL(string: "http://www.books.com.tw/")
        let request = NSURLRequest(URL: SignInurl!)
        CalenderWebView.loadRequest(request)
        
//        BookingAlertView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }
    
    func bookingConfirm(){
        presentPopupView(BookingAlertView)
    }
//    
//    func fadeOut(){
//        dismissPopupView()
//        print("fromWeb")
//    }
    
}
