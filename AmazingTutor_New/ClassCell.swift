//
//  ClassCell.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/25.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class ClassCell: UITableViewCell {

    @IBOutlet weak var BookedTeacherImage: UIImageView!
    @IBOutlet weak var BookedCourseTitle: UILabel!
    @IBOutlet weak var BookedDate: UILabel!
    @IBOutlet weak var BookedTime: UILabel!
    @IBOutlet weak var BookedTeacherName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
