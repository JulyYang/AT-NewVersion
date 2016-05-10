//
//  TInfoViewController.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/29.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import APESuperHUD

class TInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var TDetailIndex : Int = 0
    var TeacherCollection: AllTeachers = AllTeachers()
    var StudentCollection: AllStudents = AllStudents()
    
    @IBOutlet weak var TInfoTable: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TInfoTable.registerNib(UINib(nibName: "TListCell",bundle: nil), forCellReuseIdentifier: "TDCell")
        TInfoTable.registerNib(UINib(nibName: "EduCell",bundle: nil), forCellReuseIdentifier: "ECell")
        TInfoTable.registerNib(UINib(nibName: "EduCell",bundle: nil), forCellReuseIdentifier: "WCell")
        TInfoTable.registerNib(UINib(nibName: "RatingCell",bundle: nil), forCellReuseIdentifier: "RCELL")
        TInfoTable.rowHeight = UITableViewAutomaticDimension
        TInfoTable.estimatedRowHeight = 400.0
        
        TInfoTable.dataSource = self
        TInfoTable.delegate = self
        
        APESuperHUD.showOrUpdateHUD(loadingIndicator: .Standard, message: "", presentingView: self.view)
        fakeAPICall(){
            APESuperHUD.removeHUD(animated: true, presentingView: self.view, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.hidden = false
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
//            return data.count
        case 2:
            return 4
//            return data.count
        default:
            return StudentCollection.ArrayStudents.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let cell = TInfoTable.dequeueReusableCellWithIdentifier("TDCell", forIndexPath: indexPath) as! TListCell
            let myURL = TeacherCollection.ArrayTeachers[TDetailIndex].TeacherVideoURL
            cell.TeacherVideo.loadVideoURL(myURL!)
            
            cell.TeacherImage.image = UIImage(named: TeacherCollection.ArrayTeachers[TDetailIndex].TeacherImageURL!)
            cell.TeacherImage.layer.cornerRadius = 60.0
            cell.TNationalityImage.image = UIImage(named: "ROC_FLAG")
            cell.TeacherNameLabel.text = TeacherCollection.ArrayTeachers[TDetailIndex].TeacherName
            cell.LanguageLabel.text = "Chinese, English, Bananise"
            cell.RateLabel.text = TeacherCollection.ArrayTeachers[TDetailIndex].Rate
            cell.RateLabel.textColor = UIColor.redColor()
            cell.TrailLabel.text = TeacherCollection.ArrayTeachers[TDetailIndex].Trail
            cell.StarLabel.text = TeacherCollection.ArrayTeachers[TDetailIndex].StarScores
            cell.CommentLabel.text = TeacherCollection.ArrayTeachers[TDetailIndex].CommentNumber
            cell.TeacherSelfIntroLabel.text = TeacherCollection.ArrayTeachers[TDetailIndex].TeacherSelfIntro
            cell.selectionStyle = .None
            return cell
            
        case 1:
            let cell = TInfoTable.dequeueReusableCellWithIdentifier("ECell", forIndexPath: indexPath) as! EduCell
            cell.YearLabel.text = "1999-2210"
            cell.EduTitleLabel.text = "National Taiwan University"
            cell.EduDetailLabel.text = "Dr. Hockings – a member of the American Holistic Medical Association and the American Diabetes Association (ADA)"
            cell.introLabel.text = "According to Dr. Hockings' latest research, which is also included in his best selling new book. Imagine Living Without Type 2 Diabetes: Discover A Natural Alternative to Pharmaceuticals, there are 26 million people with Type 2 Diabetes in the U.S. and 79 million pre-diabetics whose blood sugar is at a point just below being diagnosed as Type 2."
            cell.selectionStyle = .None
            
            print("web")
            return cell
            
        case 2:
            let cell = TInfoTable.dequeueReusableCellWithIdentifier("WCell", forIndexPath: indexPath) as! EduCell
            cell.YearLabel.text = "1880-2230"
            cell.EduTitleLabel.text = ""
            cell.EduDetailLabel.text = "Dr. Hockings – a member of the American Holistic Medical Association and the American Diabetes Association (ADA)"
            cell.introLabel.text = "According to Dr. Hockings' latest research, which is also included in his best selling new book. Imagine Living Without Type 2 Diabetes: Discover A Natural Alternative to Pharmaceuticals, there are 26 million people with Type 2 Diabetes in the U.S. and 79 million pre-diabetics whose blood sugar is at a point just below being diagnosed as Type 2."
            cell.selectionStyle = .None
            return cell
            
        default:
            let cell = TInfoTable.dequeueReusableCellWithIdentifier("RCELL", forIndexPath: indexPath) as! RatingCell
//            cell.UserImage.image = UIImage
            cell.UserName.text = StudentCollection.ArrayStudents[indexPath.row].UserName
            cell.UserNationality.text = StudentCollection.ArrayStudents[indexPath.row].UserNationality
            cell.StarComment.text = StudentCollection.ArrayStudents[indexPath.row].StarRating
            cell.Comment.text = StudentCollection.ArrayStudents[indexPath.row].UserComment
            cell.CommentDate.text = StudentCollection.ArrayStudents[indexPath.row].RatingDate
            cell.selectionStyle = .None
            return cell
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 1:
            return "Education"
        case 2:
            return "Working Experience"
        case 3:
            return "Rating"
        default:
            return nil
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        default:
            return 40.0
        }
    }
    
    func navigationSetting(){
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 180.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        self.navigationItem.title = "BANANA YELLOW"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Helvetica", size: 17)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
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
