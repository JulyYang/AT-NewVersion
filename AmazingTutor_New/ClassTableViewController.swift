//
//  ClassTableViewController.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/27.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class Classes: UITableViewController {
    
    @IBOutlet weak var ClassTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ClassTable.registerNib(UINib(nibName: "ClassCell", bundle: nil), forCellReuseIdentifier: "ClassContent")
        ClassTable.rowHeight = 150.0
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 180.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 4
//            return data.count
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        
        switch indexPath.section{
        case 0:
            cell = tableView.dequeueReusableCellWithIdentifier("ClassStatus", forIndexPath: indexPath)
        case 1:
            cell = tableView.dequeueReusableCellWithIdentifier("ClassNumber", forIndexPath: indexPath)
        default:
            cell = tableView.dequeueReusableCellWithIdentifier("ClassContent", forIndexPath: indexPath)
        
        }
        return cell!
    }
}
