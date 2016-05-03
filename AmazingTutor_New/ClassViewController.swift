//
//  ClassViewController.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/5/3.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import STZPopupView

class ClassViewController: UIViewController, UITableViewDelegate, goToHangoutAlertDelegate {

    @IBOutlet weak var HeaderView: UIView!
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
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 3:
            return 4 //return data.count
        default:
            return 1
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
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
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        switch indexPath.section{
        case 3:
            return true
        default:
            return false
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //        dataArray.removeAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        alertDeleteMessege()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
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
        let HangoutView = HangoutAlert.instanceFromNib()
        print(HangoutView.frame)
        let popupConfig = STZPopupViewConfig()
        popupConfig.dismissTouchBackground = true
        //        popupConfig.cornerRadius = 20.0
        
        presentPopupView(HangoutView, config: popupConfig)
        print(HangoutView.frame)
    }
    
    func navigationSetting(){
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 180.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }

}
