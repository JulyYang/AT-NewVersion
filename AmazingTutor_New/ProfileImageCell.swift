//
//  ProfileImageCell.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/26.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

protocol ProfileImageCellDelegate: class {
    func ChangeImageForm()
    func changeBackground()
}

class ProfileImageCell: UITableViewCell,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    weak var PImageDelegate: ProfileImageCellDelegate?

    @IBOutlet weak var UserProfileImage: UIImageView!
    @IBOutlet weak var UserProfileBackground: UIImageView!
    
    @IBAction func ChangeImage(sender: AnyObject) {
        PImageDelegate?.ChangeImageForm()
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            let UserImagePicker = UIImagePickerController()
            UserImagePicker.delegate = self
            UserImagePicker.sourceType = .Camera
            UserImagePicker.allowsEditing = true
        }

    }
    
    @IBAction func ChangeBackground(sender: AnyObject) {
        PImageDelegate?.changeBackground()
        print("background")
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .None

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
//    func UserImagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){self.dismissViewControllerAnimated(true, completion: { () -> Void in})
//        
//        imageView!.image = image
//    }

}
