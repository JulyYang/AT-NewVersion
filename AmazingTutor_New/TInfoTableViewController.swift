//
//  TInfoTableViewController.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/19.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class TInfoTableViewController: UITableViewController {
    
    var TDetailIndex : Int?
    var reuseIdentifier: String = ""

    @IBOutlet weak var TDetailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.TDetailTableView.registerNib(UINib(nibName: "TBackgroundCell",bundle: nil), forCellReuseIdentifier: "BCELL")
        
        self.navigationItem.title = "BANANA YELLOW"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let TDetailcell = tableView.dequeueReusableCellWithIdentifier("BCELL", forIndexPath: indexPath) as! TBackgroundCell
        
        let url = NSURL(string: "https://www.google.com")
//        let BURL = TBackgroundCell.TBackgroundURL
        let request = NSURLRequest(URL: url!)
        
        TDetailcell.BackgroundLabel.text = TBackground.BackgroundText
        TDetailcell.BackgroundContentWeb.loadRequest(request)
        
        print("web")
        
        return TDetailcell
    }
    

}
