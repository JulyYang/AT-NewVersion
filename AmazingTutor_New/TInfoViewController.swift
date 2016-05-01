//
//  TInfoViewController.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/29.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class TInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var TDetailIndex : Int?
    
    @IBOutlet weak var TInfoTable: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("here")
        
        TInfoTable.registerNib(UINib(nibName: "TListCell",bundle: nil), forCellReuseIdentifier: "TDCell")
        TInfoTable.registerNib(UINib(nibName: "TBackgroundCell",bundle: nil), forCellReuseIdentifier: "BCELL")
        TInfoTable.registerNib(UINib(nibName: "RatingCell",bundle: nil), forCellReuseIdentifier: "RCELL")
        TInfoTable.rowHeight = UITableViewAutomaticDimension
        TInfoTable.estimatedRowHeight = 400.0
//        TInfoTable.scrollEnabled = true
        
        TInfoTable.dataSource = self
        TInfoTable.delegate = self
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 180.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        self.navigationItem.title = "BANANA YELLOW"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Helvetica", size: 17)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 5
//            return data.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let cell = TInfoTable.dequeueReusableCellWithIdentifier("TDCell", forIndexPath: indexPath) as! TListCell
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
            cell.selectionStyle = .None
            
            return cell
            
        case 1:
            let cell = TInfoTable.dequeueReusableCellWithIdentifier("BCELL", forIndexPath: indexPath) as! TBackgroundCell
            let url = NSURL(string: "http://www.iucn.org/")
            //        let BURL = TBackgroundCell.TBackgroundURL
            let request = NSURLRequest(URL: url!)
            
            cell.BackgroundLabel.text = TBackground.BackgroundText
            cell.BackgroundContentWeb.loadRequest(request)
            cell.selectionStyle = .None
            
            print("web")
            return cell
            
        default:
            let cell = TInfoTable.dequeueReusableCellWithIdentifier("RCELL", forIndexPath: indexPath) as! RatingCell
            cell.selectionStyle = .None
            
            return cell
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.hidden = false

    }
}
