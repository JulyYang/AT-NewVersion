//
//  ClassViewController.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/5/3.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import STZPopupView

class ClassViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    //, goToHangoutAlertDelegate {
    
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var ClassTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ClassTable.registerNib(UINib(nibName: "ClassCell", bundle: nil), forCellReuseIdentifier: "ClassContent")
        ClassTable.rowHeight = UITableViewAutomaticDimension
        ClassTable.estimatedRowHeight = 100.0
        
        ClassTable.dataSource = self
        ClassTable.delegate = self
        
        navigationSetting()
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
        let _ = tableView.dequeueReusableCellWithIdentifier("ClassContent", forIndexPath: indexPath)
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
}
