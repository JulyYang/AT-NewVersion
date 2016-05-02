//
//  alertTest.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/4/30.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class alertTest: UIViewController, alertSheetDelegate {
    
    func jumpOut() {
        print("xoxo")
    }

    @IBAction func alertTest(sender: AnyObject) {
        print("alertTest")
//        (BookingSuccess)
    }
    
    func fadeOut() {
        print("hihihihihi")
//        self.removeFromSuperview(BookingSuccess)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
