//
//  ProfileTableViewController.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/25.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController, ProfileImageCellDelegate, ProfileCellDelegate {

    @IBOutlet weak var ProfileTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 180.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        
        ProfileTable.registerNib(UINib(nibName: "ProfileImageCell", bundle: nil), forCellReuseIdentifier: "ProfileImageCell")
        ProfileTable.registerNib(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "Profile_Item_ReuseCell")
        
        ProfileTable.rowHeight = UITableViewAutomaticDimension
        ProfileTable.estimatedRowHeight = 50.0
        
        
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
            return 2
//            return data.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        
        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCellWithIdentifier("ProfileImageCell", forIndexPath: indexPath)
        default:
            cell = tableView.dequeueReusableCellWithIdentifier("Profile_Item_ReuseCell", forIndexPath: indexPath)
        }
        return cell!
    }
}
