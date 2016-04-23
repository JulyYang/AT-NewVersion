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

var TListArray = [Teacher]()
var ArrayNumber: Int?


class TListTableViewController: UITableViewController {
//,UISearchResultsUpdating,UISearchBarDelegate {

    
    @IBOutlet weak var TListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.TListTable.registerNib(UINib(nibName: "TListCell", bundle: nil), forCellReuseIdentifier: "Tcell")
        
//        TListTable.rowHeight = UITableViewAutomaticDimension
        
        
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
//        
//        Alamofire.request(.GET, TInfoURL).responseJSON { (response) in
//            let TDatabase = JSON(response.result.value!)
//            
//            for (_,Tjson):(String, JSON) in TDatabase{
//                
//                let teacherList = Teacher()
//                let languageArray : String?
//                
//                teacherList.TeacherVideoURL = Tjson["teacher_video"]
//                teacherList.TeacherImageURL = Tjson["teacher_image"].stringValue
////                teacherList.TeacherNationalityImage = Tjson["teacher_nationality_flag"]
//                teacherList.TeacherName = Tjson["teacher_name"].stringValue
//                teacherList.CommentNumber = Tjson["comment_number"].intValue
//                teacherList.StarScores = Tjson["star_scores"].stringValue
//                languageArray = Tjson["languages"].stringValue
//                teacherList.Languages = [languageArray!]
//                teacherList.Rate = Tjson["tuition_rate"].intValue
//                teacherList.Trail = Tjson["teacher_trail"].boolValue
//                teacherList.TeacherSelfIntro = Tjson["teacher_self_introduction"].stringValue
//                teacherList.TeacherBackground = Tjson["teacher_background"]
//                
//                TListArray.append(teacherList)
//            }
//                self.tableView.reloadData()
//            
//        }

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
        return 4
//            TListArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Tcell", forIndexPath: indexPath) as! TListCell
        
        let myURL = NSURL(string:"https://www.youtube.com/watch?v=LHCob76kigA")
        cell.TeacherVideo.loadVideoURL(myURL!)
        
        cell.TaecherImage.image = UIImage(named: "Oval 155")
        cell.TNationalityImage.image = UIImage(named: "ROC_FLAG")
        cell.TeacherNameLabel.text = "BANANA YELLOW"
        cell.LanguageLabel.text = "Chinese, English"
        cell.CommentLabel.text = "132"
        


        return cell
    }
    
}