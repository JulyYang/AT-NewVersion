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
import STZPopupView

//var TListArray = [Teacher]()
var ArrayNumber: Int?


class TListTableViewController: UITableViewController, UISearchControllerDelegate, UISearchResultsUpdating,UISearchBarDelegate {
    
    @IBOutlet weak var TListTable: UITableView!
    var searchController: UISearchController!
    var TeacherCollection: AllTeachers = AllTeachers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 改這個view controller的status bar顏色
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        // 註冊nib，讓tableview認識xib檔
        self.TListTable.registerNib(UINib(nibName: "TListCell", bundle: nil), forCellReuseIdentifier: "Tcell")
        TListTable.rowHeight = UITableViewAutomaticDimension
        TListTable.estimatedRowHeight = 500.0
        
        self.definesPresentationContext = true
        TListTable.delegate = self
        
        searchbarSetting()
        navigationSetting()
        tableviewHeaderBuilding()
        updatePage()
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
//        let SearchAlert = SearchView.instanceFromNib()
//        SearchAlert.frame = CGRectMake(0, 0, self.view.bounds.width, (self.view.bounds.height)*0.4)
//        self.view.addSubview(SearchAlert)
//      presentPopupView(SearchAlert)
        
//      self.searchController.active = false 害我當機嗚嗚嗚
        print("hello")
    }
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TeacherCollection.ArrayTeachers.count
//            TListArray.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let TeacherCell = TListTable.dequeueReusableCellWithIdentifier("Tcell", forIndexPath: indexPath)
        self.performSegueWithIdentifier("ShowTDetail", sender: TeacherCell)
        TListTable.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        print("\(row)")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowTDetail"{
            let indexPath = TListTable.indexPathForSelectedRow
            let destinationController = segue.destinationViewController as! TInfoViewController
            destinationController.TDetailIndex = (indexPath!.row)
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Tcell", forIndexPath: indexPath) as! TListCell
        
        let myURL = TeacherCollection.ArrayTeachers[indexPath.row].TeacherVideoURL
        cell.TeacherVideo.loadVideoURL(myURL!)
        
        cell.TeacherImage.image = UIImage(named: TeacherCollection.ArrayTeachers[indexPath.row].TeacherImageURL!)
        cell.TeacherImage.layer.cornerRadius = 60.0
        cell.TNationalityImage.image = UIImage(named: "ROC_FLAG")
        cell.TeacherNameLabel.text = TeacherCollection.ArrayTeachers[indexPath.row].TeacherName
        cell.LanguageLabel.text = "Chinese, English, Bananise"
        cell.StarLabel.text = TeacherCollection.ArrayTeachers[indexPath.row].StarScores
        cell.RateLabel.text = TeacherCollection.ArrayTeachers[indexPath.row].Rate
        cell.RateLabel.textColor = UIColor.redColor()
        cell.TrailLabel.text = TeacherCollection.ArrayTeachers[indexPath.row].Trail
        cell.CommentLabel.text = TeacherCollection.ArrayTeachers[indexPath.row].CommentNumber
        cell.TeacherSelfIntroLabel.text = nil

        return cell
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        // 讓status bar回到預設值
//        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
    }
    
    
    // 讓search bar顯示在navigation bar之上，並改變navigationbar的顏色
    func navigationSetting() {
        self.navigationItem.titleView = searchController.searchBar
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 180.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
    }
    
    func searchbarSetting(){
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

//        disablesAutomaticKeyboardDismissal()
    
    }
    
    func tableviewHeaderBuilding(){
        // 建立tableview header
        let TeacherWallHeaderView = UIView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.layer.frame.height/4))
        let TitleLabel = UILabel(frame: CGRect(x: 13, y: 20, width: (self.view.bounds.width)*0.8 , height:TeacherWallHeaderView.bounds.height/4))
        let SubLabel = UILabel(frame: CGRect(x: 13, y: 60, width: (self.view.bounds.width)*0.9, height: TeacherWallHeaderView.bounds.height/2))
        TitleLabel.text = "Find a Chinese Tutor"
        TitleLabel.textColor = UIColor.whiteColor()
        TitleLabel.font = UIFont(name: "Helvetica", size: 32)
        
        SubLabel.text = "Amazingtutor brings you perfect and self-paced access to learn Chinese. Find enthusiastic and excellent teachers to complete your learning experience."
        SubLabel.textColor = UIColor.whiteColor()
        SubLabel.lineBreakMode = .ByWordWrapping
        SubLabel.numberOfLines = 0
        SubLabel.font = UIFont(name: "Helvetica", size: 18)
        
        TeacherWallHeaderView.backgroundColor = UIColor(red: 255.0/255.0, green: 95.0/255.0, blue: 95.0/255.0, alpha: 1.0)
        TeacherWallHeaderView.addSubview(TitleLabel)
        TeacherWallHeaderView.addSubview(SubLabel)
        self.TListTable.tableHeaderView = TeacherWallHeaderView
    }
    
    func updatePage(){
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
        tableView.dg_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
        
        tableView.reloadData()
    }
    
    
    func netDataRequest(){
        //            Alamofire.request(.GET, TInfoURL).responseJSON { (response) in
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
    
}