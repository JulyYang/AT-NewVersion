//
//  TListTableViewController.swift
//  AmazingTutor
//
//  Created by apple on 2016/4/8.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

let BaseURL = ""
var DataArray = []

class TListTableViewController: UITableViewController,UISearchResultsUpdating,UISearchBarDelegate {
    
    var TeacherSearchController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.TeacherSearchController = UISearchController(searchResultsController: nil)
        self.TeacherSearchController.searchResultsUpdater = self
//        self.TeacherSearchController.delegate = self
        self.TeacherSearchController.searchBar.delegate = self
        
        self.TeacherSearchController.hidesNavigationBarDuringPresentation = false
        self.TeacherSearchController.dimsBackgroundDuringPresentation = true
        
        self.navigationItem.titleView = TeacherSearchController.searchBar
        self.definesPresentationContext = true
        
        self.setLeftButton()

    }
    
    func setLeftButton(){
        let LeftButton = UIButton(frame:CGRectMake(0,0,30,30))
        LeftButton.setBackgroundImage(UIImage(named: "speech_bubble"), forState: .Normal)
        LeftButton.adjustsImageWhenHighlighted = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView:LeftButton)
   
    
    }
    
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        print("hello")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
