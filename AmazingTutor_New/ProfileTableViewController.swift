//
//  ProfileTableViewController.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/25.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController, ProfileImageCellDelegate, ProfileCellDelegate {

    func ChangeImageForm() {

    }
    
    func changeBackground() {
        print ("yap u made it")
    }
    
    func DoNothing() {
        print ("Congradulation!")
    }
    
    @IBOutlet weak var ProfileTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 180.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        
        ProfileTable.registerNib(UINib(nibName: "ProfileImageCell", bundle: nil), forCellReuseIdentifier: "ProfileImageCell")
        ProfileTable.registerNib(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "Profile_Item_ReuseCell")
        
        ProfileTable.rowHeight = UITableViewAutomaticDimension
        ProfileTable.estimatedRowHeight = 120.0
        
        ProfileTable.delegate = self
        ProfileTable.dataSource = self
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 4
//            return data.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("ProfileImageCell", forIndexPath: indexPath) as! ProfileImageCell
            cell.PImageDelegate = self
            cell.UserProfileImage.image = UIImage(named: "Oval 155")
            cell.UserProfileImage.layer.cornerRadius = 30.0
            cell.UserProfileBackground.image = UIImage(named: "6")
            
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("Profile_Item_ReuseCell", forIndexPath: indexPath) as! ProfileCell
            cell.testDelegate = self
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
}
