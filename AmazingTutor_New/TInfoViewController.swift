//
//  TInfoViewController.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/29.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class TInfoViewController: UIViewController, UITableViewDelegate {

    var TDetailIndex : Int?
    
    @IBOutlet weak var TInfoTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("here")
        
        self.TInfoTable.registerNib(UINib(nibName: "TListCell",bundle: nil), forCellReuseIdentifier: "TDCell")
        self.TInfoTable.registerNib(UINib(nibName: "TBackgroundCell",bundle: nil), forCellReuseIdentifier: "BCELL")
        TInfoTable.rowHeight = UITableViewAutomaticDimension
        TInfoTable.estimatedRowHeight = 200.0
        
//        TInfoTable.dataSource = self
//        TInfoTable.delegate = self
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 180.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationItem.title = "BANANA YELLOW"

    }

    override func didReceiveMemoryWarning() {
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
    
    
    
}
