//
//  TBackgroundCell.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/19.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class TBackgroundCell: UITableViewCell {

    @IBOutlet weak var BackgroundLabel: UILabel!
    @IBOutlet weak var BackgroundContentWeb: UIWebView!
    override func awakeFromNib() {
        super.awakeFromNib()
        BackgroundLabel.text = TBackground.BackgroundText
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}