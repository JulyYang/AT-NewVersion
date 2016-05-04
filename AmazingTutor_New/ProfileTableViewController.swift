//
//  ProfileTableViewController.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/25.
//  Copyright © 2016年 apple. All rights reserved.
//
import UIKit

class ProfileTableViewController: UITableViewController, ProfileImageCellDelegate, ProfileCellDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let UserImagePicker = UIImagePickerController()
    var profileImage:UIImage?
    var backgroungImage:UIImage?
    var isSelectingProfileImage: Bool?
    var isSourceTypeFromLibrary: Bool?
    
    @IBOutlet weak var ProfileTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 180.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        
        ProfileTable.registerNib(UINib(nibName: "ProfileImageCell", bundle: nil), forCellReuseIdentifier: "ProfileImageCell")
        ProfileTable.registerNib(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "Profile_Item_ReuseCell")
        
        ProfileTable.rowHeight = UITableViewAutomaticDimension
        ProfileTable.estimatedRowHeight = 400.0
        ProfileTable.delegate = self
        ProfileTable.dataSource = self
    }
    //View順序 didload> willappear >didappear
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
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
            if profileImage != nil {
                cell.UserProfileImage.image = profileImage!
            }
            if backgroungImage != nil{
                cell.UserProfileBackground.image = backgroungImage!
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("Profile_Item_ReuseCell", forIndexPath: indexPath) as! ProfileCell
            cell.testDelegate = self
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }

    func userImageAlert(){
        self.isSelectingProfileImage = true
        imageAlert()
    }
    
    func backgroundImageAlert(){
        self.isSelectingProfileImage = false
        imageAlert()
    }
    
    func changeImage(type: UIImagePickerControllerSourceType) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            UserImagePicker.sourceType = type
            UserImagePicker.delegate = self
            presentViewController(UserImagePicker,animated: true, completion: nil)
        }
    }
    
    func imageAlert(){
        let ImageOption = UIAlertController(title: nil, message: nil,preferredStyle: .ActionSheet)
        let OptionOne = UIAlertAction(title: "Choose from library", style: .Default, handler: {(UIAlertAction) -> Void in
            self.changeImage(.PhotoLibrary)
            self.isSourceTypeFromLibrary = true
        })
        let OptionTwo = UIAlertAction(title: "Take profile photo", style: .Default, handler: {(UIAlertAction) -> Void in
            self.changeImage(.Camera)
            self.isSourceTypeFromLibrary = false
        })
        let OptionThree = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        ImageOption.addAction(OptionOne)
        ImageOption.addAction(OptionTwo)
        ImageOption.addAction(OptionThree)
        self.presentViewController(ImageOption, animated: true, completion: nil)
    }
    
//    func changeBackground() {
//        if UIImagePickerController.isSourceTypeAvailable(.Camera){
//            UserBImagePicker.sourceType = .Camera
//            UserBImagePicker.delegate = self
//            presentViewController(UserBImagePicker,animated: true, completion: nil)
//        }
//        print ("yap u made it")
//    }
    
    //MARK:UIImagePickerControllerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        if self.isSelectingProfileImage == true {
            profileImage = image
        } else {
            backgroungImage = image
        }
        if self.isSourceTypeFromLibrary == false{
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func DoNothing() {
        print ("Congradulation!")
    }
}
