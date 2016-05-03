//
//  BookingSuccess.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/5/2.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

protocol alertSheetDelegate: class {
    func fadeOut()
}

class BookingSuccess: UIView {
    weak var alertDelegate : alertSheetDelegate?

    
    @IBOutlet weak var BaseView: UIView!
    @IBOutlet weak var AmazingTitle: UILabel!
    @IBOutlet weak var TutorTitle: UILabel!
    @IBOutlet weak var SubTitle: UILabel!
    @IBAction func BookingCheck(sender: AnyObject) {
//        let DesinationStoryboard = UIStoryboard(name: "", bundle: nil)
//        let RootController = RootStoryboard.instantiateViewControllerWithIdentifier("MainTabBarController")
//        self.window!.rootViewController = RootControllerself.removeFromSuperview()
        
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "BookingSuccess", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! UIView
    }
}


