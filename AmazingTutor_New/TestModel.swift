//
//  TestModel.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/5/7.
//  Copyright © 2016年 apple. All rights reserved.
//

import Foundation
import Firebase

//
//struct Teacher {
//    var Teacher_id: String
//    var TeacherVideoURL: UIImage
//    var TeacherImage: UIImage
//    var TeacherNationalityImage: UIImage
//    var TeacherName: String
//    var CommentNumber: Int
//    var StarScores: String
//    var Languages : [String]
//    var Rate: Int
//    var Trail: Bool
//    var TeacherSelfIntro: String
//    var TeacherBackground: String
//    var TeacherCalender: NSURL
//    var AvailableDate: NSDate
//    var AvailableTime: [String]
//}
//
//class NetworkManager {
//    static let sharedInstance = NetworkManager()
//    
//    var rootRef: Firebase
//    var teachers = [Teacher]()
//    
//    init() {
//        rootRef = Firebase(url:"https://acexam.firebaseio.com/")
//    }
//    
//    func resetData() {
//        teachers.removeAll()
//        
//        teachers.append(Teacher(
//        Teacher_id: "",
//        TeacherVideoURL: UIImage(named: "")!,
//        TeacherImage: UIImage(named: "")!,
//        TeacherNationalityImage: UIImage(named: "")!,
//        TeacherName: "",
//        CommentNumber: 4,//暫時訂的
//        StarScores: "",
//        Languages : [""],
//        Rate: 5, //暫時訂的
//        Trail: true,
//        TeacherSelfIntro: "",
//        TeacherBackground: "",
//        TeacherCalender: NSURL(string:"")!,
//        AvailableDate: NSDate(),
//        AvailableTime: [""]
//            ))
//        saveData()
//    }
//    
//    func saveData() {
//        let teachersRef = rootRef.childByAppendingPath("teachers")
//        var teachers = [[String: String]]()
//        
////        HUD.show(.Progress)
//        
//        for teacher in self.teachers {
//            let imageData = UIImageJPEGRepresentation(teacher.TeacherImage, 1.0)
//            
//            teachers.append([
//                "name": teacher.TeacherName,
//                "picture": imageData?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions()) ?? "",
//                "address": teacher.Languages,
//                "tel": teacher.TeacherSelfIntro,
//                "website": teacher.,
//                "description": book.description
//                ])
//        }
//        
//        booksRef.setValue(books)
//        
//        HUD.hide()
//    }
//    
//    func getData(callback: ([Book]) -> Void) {
//        
//        let booksRef = rootRef.childByAppendingPath("books")
//        
//        HUD.show(.Progress)
//        
//        booksRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
//            
//            self.books.removeAll()
//            
//            if let books = snapshot.value as? NSArray {
//                
//                for book in books {
//                    let imageData = NSData(base64EncodedString: book.objectForKey("picture") as! String, options: NSDataBase64DecodingOptions())
//                    
//                    self.books.append(Book(
//                        name: book.objectForKey("name") as! String,
//                        picture: UIImage(data: imageData!)!,
//                        address: book.objectForKey("address") as! String,
//                        tel: book.objectForKey("tel") as! String,
//                        website: NSURL(string: book.objectForKey("website") as! String)!,
//                        description: book.objectForKey("description") as! String
//                        ))
//                }
//            }
//            
//            HUD.hide()
//            
//            callback(self.books)
//        })
//    }
//}
