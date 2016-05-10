//
//  BookingSuccess.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/5/2.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import STZPopupView
import APESuperHUD

protocol alertSheetDelegate: class {
    func fadeOut()
    func backToMainPage()
}

class BookingSuccess: UIView {
    weak var alertDelegate : alertSheetDelegate?

    @IBOutlet weak var BaseView: UIView!
    @IBOutlet weak var AmazingTitle: UILabel!
    @IBOutlet weak var TutorTitle: UILabel!
    @IBOutlet weak var SubTitle: UILabel!
    
    @IBAction func BookingCheck(sender: AnyObject) {
        alertDelegate?.fadeOut()
        
        //        let DesStoryboard = UIStoryboard(name: "TList", bundle: nil)
//        let DesController = DesStoryboard.instantiateViewControllerWithIdentifier("ClassViewController")
//        self.window!.rootViewController = DesController
    }
    
    class func instanceFromNib() -> BookingSuccess {
        return UINib(nibName: "BookingSuccess", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! BookingSuccess
    }
}


