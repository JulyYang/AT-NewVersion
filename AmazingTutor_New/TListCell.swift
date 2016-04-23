//
//  TListCell.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/18.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import YouTubePlayer


class TListCell: UITableViewCell {
    
    @IBOutlet weak var TeacherVideo: YouTubePlayerView!
    @IBOutlet weak var TaecherImage: UIImageView!
    @IBOutlet weak var TeacherNameLabel: UILabel!
    @IBOutlet weak var StarLabel: UILabel!
    @IBOutlet weak var CommentLabel: UILabel!
    @IBOutlet weak var LanguageLabel: UILabel!
    @IBOutlet weak var RateLabel: UILabel!
    @IBOutlet weak var TrailLabel: UILabel!
    @IBOutlet weak var TNationalityImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
