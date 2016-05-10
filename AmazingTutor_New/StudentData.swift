//
//  StudentData.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/5/11.
//  Copyright © 2016年 apple. All rights reserved.
//

import Foundation

class AllStudents{
    var ArrayStudents:[Student] = []
    
    init(){
        let Student1: Student = Student()
        Student1.UserName = "Apple"
        Student1.ProfileImage = ""
        Student1.UserNationality = "United State"
        Student1.StarRating = "⭐️⭐️⭐️⭐️⭐️"
        Student1.UserComment = "Excellent."
        Student1.RatingDate = "May 10 ,2016"
        
        let Student2: Student = Student()
        Student2.UserName = "Apple"
        Student2.ProfileImage = ""
        Student2.UserNationality = "United State"
        Student2.StarRating = "⭐️⭐️⭐️⭐️⭐️"
        Student2.UserComment = "Excellent."
        Student2.RatingDate = "May 10 ,2016"
        
        let Student3: Student = Student()
        Student3.UserName = "Apple"
        Student3.ProfileImage = ""
        Student3.UserNationality = "United State"
        Student3.StarRating = "⭐️⭐️⭐️⭐️⭐️"
        Student3.UserComment = "Excellent."
        Student3.RatingDate = "May 10 ,2016"
        
        let Student4: Student = Student()
        Student4.UserName = "Apple"
        Student4.ProfileImage = ""
        Student4.UserNationality = "United State"
        Student4.StarRating = "⭐️⭐️⭐️⭐️⭐️"
        Student4.UserComment = "Excellent."
        Student4.RatingDate = "May 10 ,2016"
        
        let Student5: Student = Student()
        Student5.UserName = "Apple"
        Student5.ProfileImage = ""
        Student5.UserNationality = "United State"
        Student5.StarRating = "⭐️⭐️⭐️⭐️⭐️"
        Student5.UserComment = "Excellent."
        Student5.RatingDate = "May 10 ,2016"
        
        ArrayStudents = [Student1, Student2, Student3, Student4, Student5]
    }
}
