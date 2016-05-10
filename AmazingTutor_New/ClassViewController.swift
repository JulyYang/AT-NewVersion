//
//  ClassViewController.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/5/3.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import STZPopupView
import APESuperHUD

class ClassViewController: UIViewController, UITableViewDelegate,UITableViewDataSource , goToHangoutAlertDelegate, UIGestureRecognizerDelegate {
        
    @IBOutlet weak var HeaderView: UIView!
    
    @IBOutlet weak var ScheduledNumber: UILabel!
    @IBOutlet weak var ScheduledLabel: UILabel!
    @IBOutlet weak var PastNumber: UILabel!
    @IBOutlet weak var PastLabel: UILabel!
    @IBOutlet weak var UnsheduledNumber: UILabel!
    @IBOutlet weak var UnscheduledLabel: UILabel!
    @IBOutlet weak var SubTitle: UILabel!
    @IBAction func ScheduledButton(sender: AnyObject) {
        ScheduledLabel.backgroundColor = UIColor(red: 46/255, green: 206/255, blue: 172/255, alpha: 1.0)
        ScheduledNumber.backgroundColor = UIColor(red: 46/255, green: 206/255, blue: 172/255, alpha: 1.0)
        SubTitle.textColor = UIColor(red: 46/255, green: 206/255, blue: 172/255, alpha: 1.0)
        SubTitle.text = "SCHEDULED"
        pastColorBackToDefault()
        unscheduledColorBackToDefault()
    }
    @IBAction func PastButton(sender: AnyObject) {
        PastLabel.backgroundColor = UIColor(red: 255/255, green: 170/255, blue: 165/255, alpha: 1.0)
        PastNumber.backgroundColor = UIColor(red: 255/255, green: 170/255, blue: 165/255, alpha: 1.0)
        SubTitle.textColor = UIColor(red: 255/255, green: 170/255, blue: 165/255, alpha: 1.0)
        SubTitle.text = "PAST"
        sheduledColorBackToDefault()
        unscheduledColorBackToDefault()
    }
    @IBAction func UnscheduledButton(sender: AnyObject) {
        UnscheduledLabel.backgroundColor = UIColor(red: 255/255, green: 222/255, blue: 120/255, alpha: 1.0)
        UnsheduledNumber.backgroundColor = UIColor(red: 255/255, green: 222/255, blue: 120/255, alpha: 1.0)
        SubTitle.textColor = UIColor(red: 254/255, green: 217/255, blue: 112/255, alpha: 1.0)
        SubTitle.text = "UNSCHEDULED"
        sheduledColorBackToDefault()
        pastColorBackToDefault()
     }
    
    @IBOutlet weak var ClassTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ClassTable.registerNib(UINib(nibName: "ClassCell", bundle: nil), forCellReuseIdentifier: "ClassContent")
        ClassTable.rowHeight = UITableViewAutomaticDimension
        ClassTable.estimatedRowHeight = 100.0
        
        ClassTable.dataSource = self
        ClassTable.delegate = self
        
        navigationSetting()
        
        ScheduledLabel.backgroundColor = UIColor(red: 46/255, green: 206/255, blue: 172/255, alpha: 1.0)
        ScheduledNumber.backgroundColor = UIColor(red: 46/255, green: 206/255, blue: 172/255, alpha: 1.0)
        SubTitle.textColor = UIColor(red: 46/255, green: 206/255, blue: 172/255, alpha: 1.0)
        SubTitle.text = "SCHEDULED"
        
        APESuperHUD.showOrUpdateHUD(loadingIndicator: .Standard, message: "", presentingView: self.view)
        fakeAPICall(){
            APESuperHUD.removeHUD(animated: true, presentingView: self.view, completion: nil)
//            let storyboard = UIStoryboard(name: "TList", bundle: nil)
//            let viewController = storyboard.instantiateViewControllerWithIdentifier("ClassViewController")
//            self.presentViewController(viewController, animated: true, completion: nil)
//            NSUserDefaults.standardUserDefaults().setValue(self., forKey: <#T##String#>)
//            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4 //return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ClassContent", forIndexPath: indexPath) as! ClassCell
        cell.BookedTeacherImage.image = UIImage(named: "Bob_minions_hands")
        cell.BookedTeacherImage.layer.cornerRadius = 60.0
        cell.BookedCourseTitle.text = "Banana Song"
        cell.BookedDate.text = "May, 1st, 2016"
        cell.BookedTime.text = "9:00 AM"
        cell.BookedTeacherName.text = "BANANA YELLOW"
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //        dataArray.removeAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        alertDeleteMessege()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let _ = tableView.dequeueReusableCellWithIdentifier("ClassContent", forIndexPath: indexPath) as! ClassCell
        goToHangoutAlert()
    }
    
    func alertDeleteMessege(){
        let ConfirmAlert = UIAlertController(title: "Want to delete this course from your lists?", message: nil , preferredStyle: .Alert)
        let Confirm = UIAlertAction(title: "Yes, I want to delete it.", style: .Default, handler: nil)
        let Cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        ConfirmAlert.addAction(Confirm)
        ConfirmAlert.addAction(Cancel)
        self.presentViewController(ConfirmAlert, animated: true, completion: nil)
    }
    
    func goToHangoutAlert(){
        let HangoutView = HangoutAlert.instanceFromNib()
        print(HangoutView.frame)
        let popupConfig = STZPopupViewConfig()
        popupConfig.dismissTouchBackground = true
        
        presentPopupView(HangoutView, config: popupConfig)
        print(HangoutView.frame)
    }
    
    func navigationSetting(){
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 180.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    func sheduledColorBackToDefault(){
        ScheduledLabel.backgroundColor = UIColor.whiteColor()
        ScheduledNumber.backgroundColor = UIColor.whiteColor()
    }
    func unscheduledColorBackToDefault(){
        UnscheduledLabel.backgroundColor = UIColor.whiteColor()
        UnsheduledNumber.backgroundColor = UIColor.whiteColor()
    }
    func pastColorBackToDefault(){
        PastLabel.backgroundColor = UIColor.whiteColor()
        PastNumber.backgroundColor = UIColor.whiteColor()
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
