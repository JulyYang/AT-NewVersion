//
//  ViewController.swift
//  AmazingTutor
//
//  Created by apple on 2016/3/29.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var PasswordConfirmText: UITextField!
    @IBAction func SignupButton(sender: AnyObject) {
//        let emailtext = EmailTextField.text
//        let passwordtext = PasswordTextField.text
//        let passwordconfirm = PasswordConfirmText.text
        
//        Alamofire.request(.POST, URLs.login, parameters: ["email": emailtext!, "password": passwordtext!, "api_key": ""]).responseJSON
//            { response in
////                if JSON(response.result.value!)[""].stringValue == "OK"{
//                
//                }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.EmailTextField.delegate = self
        self.NameTextField.delegate = self
        self.PasswordTextField.delegate = self
        self.PasswordConfirmText.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}
