//
//  ProfileCell.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/26.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

protocol ProfileCellDelegate: class {
    
}

class ProfileCell: UITableViewCell {

    @IBOutlet weak var ProfileItem: UILabel!
    @IBOutlet weak var UserTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
