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
import DGElasticPullToRefresh

var TListArray = [Teacher]()
var ArrayNumber: Int?


class TListTableViewController: UITableViewController, UISearchControllerDelegate, UISearchResultsUpdating,UISearchBarDelegate {
    
    @IBOutlet weak var TListTable: UITableView!
    
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 改這個view controller的status bar顏色
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        // 建立tableview header
        let TeacherWallHeaderView = UIView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.layer.frame.height/4))
        TeacherWallHeaderView.backgroundColor = UIColor(red: 255.0/255.0, green: 95.0/255.0, blue: 95.0/255.0, alpha: 1.0)
        self.TListTable.tableHeaderView = TeacherWallHeaderView
        
        // 註冊nib，讓tableview認識xib檔
        self.TListTable.registerNib(UINib(nibName: "TListCell", bundle: nil), forCellReuseIdentifier: "Tcell")
        
        // 建立search bar
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchResultsUpdater = self
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        
        // 改search bar的背景顏色、裡面的字體顏色、user輸入的字體顏色
        let searchTeacherField = self.searchController.searchBar.valueForKey("searchField") as! UITextField
        searchTeacherField.backgroundColor = UIColor(red: 160.0/255.0, green: 36.0/255.0, blue: 36.0/255.0, alpha: 1.0)
        searchTeacherField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSForegroundColorAttributeName:UIColor.whiteColor()])
        searchTeacherField.textColor = UIColor.whiteColor()
        
        
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        
        NavigationSetting()
        
        self.definesPresentationContext = true
        
//        頁面下拉更新效果
//        Initialize tableView
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = UIColor(red: 74.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 0.6)
        tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            // Add your logic here
            // Do not forget to call dg_stopLoading() at the end
            self?.tableView.dg_stopLoading()
            }, loadingView: loadingView)
        tableView.dg_setPullToRefreshFillColor(UIColor.whiteColor())
//            (red: 166.0/255.0, green: 33.0/255.0, blue: 37.0/255.0, alpha: 1.0))
        tableView.dg_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
        
        
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
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        print("hello")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
//            TListArray.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let TeacherCell = TListTable.dequeueReusableCellWithIdentifier("Tcell", forIndexPath: indexPath)
        self.performSegueWithIdentifier("ShowTDetail", sender: TeacherCell)
//        TListTable.deselectRowAtIndexPath(indexPath, animated: true)
//        self.performSegueWithIdentifier("ShowTDetail", sender: tableView)
        
        let row = indexPath.row
        
        print("\(row)")
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Tcell", forIndexPath: indexPath) as! TListCell
        
        let myURL = NSURL(string:"https://www.youtube.com/watch?v=sFukyIIM1XI")
        cell.TeacherVideo.loadVideoURL(myURL!)
        
        cell.TeacherImage.image = UIImage(named: "Bob_minions_hands")
        cell.TeacherImage.layer.cornerRadius = 60.0
        cell.TNationalityImage.image = UIImage(named: "ROC_FLAG")
        cell.TeacherNameLabel.text = "BANANA is the best"
        cell.LanguageLabel.text = "Chinese, English, Bananise"
        cell.RateLabel.text = "400 - 650 TWD/hour"
        cell.TrailLabel.text = "Yes"
        cell.CommentLabel.text = "(698)"

        return cell
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        // 讓status bar回到預設值
//        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
    }
    
    // 讓search bar顯示在navigation bar之上，並改變navigationbar的顏色
    func NavigationSetting() {
        self.navigationItem.titleView = searchController.searchBar
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 180.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
    }

    
}