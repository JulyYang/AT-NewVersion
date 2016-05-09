//
//  CalenderWeb.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/30.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import STZPopupView

class CalenderWeb: UIViewController, alertSheetDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var BaseView: UIView!
    @IBOutlet weak var CalenderWebView: UIWebView!
    @IBOutlet weak var DatePicker: UIDatePicker!
    @IBAction func DatePickerAction(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
//        let timeFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM dd EE HH:mm"
        print(dateFormatter.stringFromDate(DatePicker.date))
    }
    @IBAction func BooknowButton(sender: AnyObject) {
        bookingConfirm()
    }
    @IBAction func CancelWebView(sender: AnyObject) {
        backToMainPage()
    }
    
    let BookingAlertView = BookingSuccess.instanceFromNib()
    let dayArray = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    let startTimeArray = ["00:00","00:30","01:00","01:30","02:00","02:30","03:00","03:30","04:00","04:30","05:00","05:30","06:00","06:30","07:00:","07:30","08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00:","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30","18:00","18:30","19:00:","19:30","20:00","20:30","21:00","21:30","22:00","22:30","23:00","23:30"]
    let endTimeArray = ["00:00","00:30","01:00:","01:30","02:00","02:30","03:00","03:30","04:00","04:30","05:00","05:30","06:00","06:30","07:00:","07:30","08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00:","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30","18:00","18:30","19:00:","19:30","20:00","20:30","21:00","21:30","22:00","22:30","23:00","23:30"]
    
    var daytime: String?
    var starttime: String?
    var endtime: String?
    
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
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return dayArray[row]
        }else if component == 1{
            return startTimeArray[row]
        }else{
            return endTimeArray[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            daytime = dayArray[row]
        }else if component == 1{
            starttime = startTimeArray[row]
        }else{
            endtime = endTimeArray[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return dayArray.count
        }else if component == 1{
            return startTimeArray.count
        }else{
            return endTimeArray.count
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func bookingConfirm(){
        
        presentPopupView(BookingAlertView)
    }
    
    func fadeOut(){
        //        dismissPopupView()
    }
    
    func backToMainPage(){
        dismissViewControllerAnimated(true, completion: nil)
    }
}
