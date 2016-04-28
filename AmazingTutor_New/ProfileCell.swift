//
//  ProfileCell.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/26.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

protocol ProfileCellDelegate: class {
    func DoNothing()
}

class ProfileCell: UITableViewCell {
    
    weak var testDelegate: ProfileCellDelegate?
    
    @IBOutlet weak var ProfileItem: UILabel!
    @IBOutlet weak var UserTextField: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        testDelegate?.DoNothing(
        print("backgroundImage")
        )
        
        self.selectionStyle = .None
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
