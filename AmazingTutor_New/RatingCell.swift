//
//  RatingCell.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/29.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class RatingCell: UITableViewCell {

    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserNationality: UILabel!
    @IBOutlet weak var StarComment: UILabel!
    @IBOutlet weak var CommentDate: UILabel!
    @IBOutlet weak var Comment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
