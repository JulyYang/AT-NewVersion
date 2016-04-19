//
//  TListTableViewController.swift
//  AmazingTutor
//
//  Created by apple on 2016/4/8.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

private let reuseIdentifier = "Tcell"

let TInfoURL = ""
var TListArray = [Teacher]()
var ArrayNumber: Int?


class TListTableViewController: UITableViewController {
//,UISearchResultsUpdating,UISearchBarDelegate {

//    var TeacherSearchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.TeacherSearchController = UISearchController(searchResultsController: nil)
//        self.TeacherSearchController.searchResultsUpdater = self
////        self.TeacherSearchController.delegate = self
//        self.TeacherSearchController.searchBar.delegate = self
//        
//        self.TeacherSearchController.hidesNavigationBarDuringPresentation = false
//        self.TeacherSearchController.dimsBackgroundDuringPresentation = true
//        
//        self.navigationItem.titleView = TeacherSearchController.searchBar
//        self.definesPresentationContext = true
//        
//        self.setLeftButton()
        
        Alamofire.request(.GET, TInfoURL).responseJSON { (response) in
            let TDatabase = JSON(response.result.value!)
            
            for (_,Tjson):(String, JSON) in TDatabase{
                
                let teacherList = Teacher()
                let languageArray : String?
                
                teacherList.TeacherVideoURL = Tjson["teacher_video"]
                teacherList.TeacherImageURL = Tjson["teacher_image"].stringValue
//                teacherList.TeacherNationalityImage = Tjson["teacher_nationality_flag"]
                teacherList.TeacherName = Tjson["teacher_name"].stringValue
                teacherList.CommentNumber = Tjson["comment_number"].intValue
                teacherList.StarScores = Tjson["star_scores"].stringValue
                languageArray = Tjson["languages"].stringValue
                teacherList.Languages = [languageArray!]
                teacherList.Rate = Tjson["tuition_rate"].intValue
                teacherList.Trail = Tjson["teacher_trail"].boolValue
                teacherList.TeacherSelfIntro = Tjson["teacher_self_introduction"].stringValue
                teacherList.TeacherBackground = Tjson["teacher_background"]
                
                TListArray.append(teacherList)
            }
                self.tableView.reloadData()
            
        }

    }
    
//    func setLeftButton(){
//        let LeftButton = UIButton(frame:CGRectMake(0,0,30,30))
//        LeftButton.setBackgroundImage(UIImage(named: "speech_bubble"), forState: .Normal)
//        LeftButton.adjustsImageWhenHighlighted = false
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView:LeftButton)
//    }
    
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        print("hello")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TListArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)


        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}