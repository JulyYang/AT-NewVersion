//
//  EduCell.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/5/9.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class EduCell: UITableViewCell {

    @IBOutlet weak var YearLabel: UILabel!
    @IBOutlet weak var EduTitleLabel: UILabel!
    @IBOutlet weak var EduDetailLabel: UILabel!
    @IBOutlet weak var introLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
