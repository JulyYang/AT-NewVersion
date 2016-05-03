//
//  ClassTableViewController.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/27.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import STZPopupView

class Classes: UITableViewController, goToHangoutAlertDelegate {

    @IBOutlet weak var ClassTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ClassTable.registerNib(UINib(nibName: "ClassCell", bundle: nil), forCellReuseIdentifier: "ClassContent")
        ClassTable.rowHeight = UITableViewAutomaticDimension
        ClassTable.estimatedRowHeight = 100.0
        navigationSetting()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 3:
            return 4 //return data.count
        default:
            return 1
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("ClassStatus", forIndexPath: indexPath)
            cell.selectionStyle = .None
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("ClassNumber", forIndexPath: indexPath)
            cell.selectionStyle = .None
            return cell
        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier("StatusHighlight", forIndexPath: indexPath)
            cell.selectionStyle = .None
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("ClassContent", forIndexPath: indexPath) as! ClassCell
            cell.BookedTeacherImage.image = UIImage(named: "Bob_minions_hands")
            cell.BookedTeacherImage.layer.cornerRadius = 60.0
            cell.BookedCourseTitle.text = "Banana Song"
            cell.BookedDate.text = "May, 1st, 2016"
            cell.BookedTime.text = "9:00 AM"
            cell.BookedTeacherName.text = "BANANA YELLOW"
            
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        switch indexPath.section{
        case 3:
            return true
        default:
            return false
        }
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //        dataArray.removeAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        alertDeleteMessege()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let _ = ClassTable.dequeueReusableCellWithIdentifier("ClassContent", forIndexPath: indexPath)
        switch indexPath.section{
        case 3:
            goToHangoutAlert()
        default:
            return
        }
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
        let TestView = HangoutAlert.instanceFromNib()
        
//        TestView.c

        presentPopupView(TestView)
        print("jjjjjjj")
    }
    
    func navigationSetting(){
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 180.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
}