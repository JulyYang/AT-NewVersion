//
//  CalenderWeb.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/30.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import STZPopupView
import APESuperHUD

class CalenderWeb: UIViewController, alertSheetDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIScrollViewDelegate {
    
    let BookingAlertView = BookingSuccess.instanceFromNib()
    var daytime: String?
    var starttime: String?
    var endtime: String?
    
    @IBOutlet weak var BaseView: UIView!
//    把webview先換掉，用imageview代替
//    @IBOutlet weak var CalenderWebView: UIWebView!
    @IBOutlet weak var CalenderScroll: UIScrollView!
    @IBOutlet weak var CalenderView: UIView!
    @IBOutlet weak var CalenderImage: UIImageView!
    @IBOutlet weak var DatePicker: UIDatePicker!
    @IBAction func DatePickerAction(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM dd EE HH:mm"
        print(dateFormatter.stringFromDate(DatePicker.date))
    }
    @IBAction func BooknowButton(sender: AnyObject) {
        bookingConfirm()
    }
    @IBAction func CancelWebView(sender: AnyObject) {
        backToMainPage()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = true
//        先把webview做成imageview
//        let SignInurl = NSURL(string: "http://www.books.com.tw/")
//        let request = NSURLRequest(URL: SignInurl!)
//        CalenderWebView.loadRequest(request)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        CalenderImage.image = UIImage(named: "Group 2")
//        CalenderImage.sizeToFit()
        CalenderScroll.contentSize = CGSizeMake(CGRectGetWidth(CalenderImage.frame), CGRectGetHeight(CalenderImage.frame))
        CalenderScroll.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }
    
    func viewForZoomingInScrollView(CalenderScroll: UIScrollView) -> UIView? {
        return self.CalenderImage
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return TimeArray.dayArray[row]
        }else if component == 1{
            return TimeArray.startTimeArray[row]
        }else{
            return TimeArray.endTimeArray[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            daytime = TimeArray.dayArray[row]
        }else if component == 1{
            starttime = TimeArray.startTimeArray[row]
        }else{
            endtime = TimeArray.endTimeArray[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return TimeArray.dayArray.count
        }else if component == 1{
            return TimeArray.startTimeArray.count
        }else{
            return TimeArray.endTimeArray.count
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func bookingConfirm(){
        self.BookingAlertView.alertDelegate = self
        presentPopupView(BookingAlertView)
    }
    
    func fadeOut(){
        print("1")
        dismissPopupView()
        APESuperHUD.showOrUpdateHUD(loadingIndicator: .Standard, message: "Loading...", presentingView: self.view)
        fakeAPICall(){
            APESuperHUD.removeHUD(animated: true, presentingView: self.view, completion: nil)
            print("2")
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
//            let DesStoryboard = UIStoryboard(name: "TList", bundle: nil)
//            let DesController = DesStoryboard.instantiateViewControllerWithIdentifier("ClassViewController")
//            self.navigationController?.pushViewController(DesController, animated: true)
//            print("3")
//
//        }
    }
    
    func backToMainPage(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func fakeAPICall(closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(1 * (NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

}
