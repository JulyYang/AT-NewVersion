//
//  SearchView.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/5/2.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class SearchView: UIView {

    @IBOutlet weak var SearchTitle1: UILabel!
    @IBOutlet weak var SearchContainer1: UIView!
    @IBOutlet weak var SearchTitle2: UILabel!
    @IBOutlet weak var SearchContainer2: UIView!
    @IBOutlet weak var PriceTitle: UILabel!
    @IBOutlet weak var PriceSlider: UISlider!
    
    @IBAction func SendToSearchBar(sender: AnyObject) {
        self.removeFromSuperview()
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "SearchView", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! UIView
    }
    
}
