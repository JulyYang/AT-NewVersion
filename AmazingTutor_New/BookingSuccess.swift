//
//  BookingSuccess.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/5/2.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

protocol alertSheetDelegate: class {
    func jumpOut()
    func fadeOut()
}

class BookingSuccess: UIView {
    
    weak var alertDelegate : alertSheetDelegate?
    
    @IBAction func BookingCheck(sender: AnyObject) {
        alertDelegate?.fadeOut()
        
    }
    
    
    func jumpOut() {
        print("hello")
    }
    
    
}


