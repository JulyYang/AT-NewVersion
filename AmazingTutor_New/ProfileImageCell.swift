//
//  ProfileImageCell.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/26.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

protocol ProfileImageCellDelegate: class {
    func userImageAlert()
    func backgroundImageAlert()
}

class ProfileImageCell: UITableViewCell,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    weak var PImageDelegate: ProfileImageCellDelegate?
    
    let UserImagePicker = UIImagePickerController()

    @IBOutlet weak var BaseView: UIView!
    @IBOutlet weak var UserProfileImage: UIImageView!
    @IBOutlet weak var UserProfileBackground: UIImageView!
    
    @IBAction func ChangeImage(sender: AnyObject) {
        PImageDelegate?.userImageAlert()
    }
    
    @IBAction func ChangeBackground(sender: AnyObject) {
        PImageDelegate?.backgroundImageAlert()
        print("background")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .None
        BaseView.layer.cornerRadius = 78.0
        BaseView.layer.masksToBounds = true
        UserProfileImage.layer.cornerRadius = 75.0
        UserProfileImage.layer.masksToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
//    func UserImagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){self.dismissViewControllerAnimated(true, completion: { () -> Void in})
//        
//        imageView!.image = image
//    }

}
