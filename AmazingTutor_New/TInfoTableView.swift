//
//  TInfoTableView.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/29.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class TInfoTableView: UITableView {
    
        
    .registerNib(UINib(nibName: "TListCell",bundle: nil), forCellReuseIdentifier: "TDCell")
        self.TInfoTable.registerNib(UINib(nibName: "TBackgroundCell",bundle: nil), forCellReuseIdentifier: "BCELL")
        TInfoTable.rowHeight = UITableViewAutomaticDimension
        TInfoTable.estimatedRowHeight = 200.0
        
        //        TInfoTable.dataSource = self
        //        TInfoTable.delegate = self
        
        self.navigationItem.title = "BANANA YELLOW"
    }
    
    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let TDetailcell = tableView.dequeueReusableCellWithIdentifier("BCELL", forIndexPath: indexPath) as! TBackgroundCell
        
        let url = NSURL(string: "https://www.google.com")
        //        let BURL = TBackgroundCell.TBackgroundURL
        let request = NSURLRequest(URL: url!)
        
        TDetailcell.BackgroundLabel.text = TBackground.BackgroundText
        TDetailcell.BackgroundContentWeb.loadRequest(request)
        
        print("web")
        
        return TDetailcell
    }


    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

