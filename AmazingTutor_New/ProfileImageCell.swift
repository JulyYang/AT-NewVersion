//
//  ProfileImageCell.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/26.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

protocol ProfileImageCellDelegate: class {
    
}

class ProfileImageCell: UITableViewCell {

    @IBOutlet weak var UserProfileImage: UIImageView!
    @IBOutlet weak var UserProfileBackground: UIImageView!
    @IBOutlet weak var ChangeImage: UIButton!
    @IBOutlet weak var ChangeBackground: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
