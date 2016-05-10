//
//  TeacherData.swift
//  AmazingTutor_New
//
//  Created by apple on 2016/5/10.
//  Copyright © 2016年 apple. All rights reserved.
//

import Foundation

class AllTeachers{
    var ArrayTeachers:[Teacher] = []
    
    init(){
        let Teacher1: Teacher = Teacher()
        Teacher1.TeacherName = "阿滴"
        Teacher1.TeacherVideoURL = NSURL(string: "https://www.youtube.com/watch?v=jqjSsoKyWGo")
        Teacher1.TeacherImageURL = "阿滴"
        Teacher1.Languages = ["Chinese", "English", "Taiwanise"]
        Teacher1.StarScores = "⭐️⭐️⭐️"
        Teacher1.CommentNumber = "(456)"
        Teacher1.Rate = "300 - 500 TWD/hour"
        Teacher1.TeacherBackground = ""
        Teacher1.Trail = "Yes"
        Teacher1.TeacherSelfIntro = ""
        
        let Teacher2: Teacher = Teacher()
        Teacher2.TeacherName = "子瑜"
        Teacher2.TeacherVideoURL = NSURL(string: "https://www.youtube.com/watch?v=ExCm_FYbu94")
        Teacher2.TeacherImageURL = "子瑜"
        Teacher2.Languages = ["Chinese", "English", "Korean"]
        Teacher2.StarScores = "⭐️⭐️⭐️⭐️⭐️"
        Teacher2.CommentNumber = "(134566)"
        Teacher2.Rate = "30000 - 50000 TWD/hour"
        Teacher2.TeacherBackground = ""
        Teacher2.Trail = "Yes"
        Teacher2.TeacherSelfIntro = ""
        
        let Teacher3: Teacher = Teacher()
        Teacher3.TeacherName = "阿滴"
        Teacher3.TeacherVideoURL = NSURL(string: "https://www.youtube.com/watch?v=rMqSQvmmM4A")
        Teacher3.TeacherImageURL = "阿滴"
        Teacher3.Languages = ["Chinese", "English", "Taiwanise"]
        Teacher3.StarScores = "⭐️⭐️"
        Teacher3.CommentNumber = "(184)"
        Teacher3.Rate = "350 - 450 TWD/hour"
        Teacher3.TeacherBackground = ""
        Teacher3.Trail = "No"
        Teacher3.TeacherSelfIntro = ""
        
        let Teacher4: Teacher = Teacher()
        Teacher4.TeacherName = "阿滴"
        Teacher4.TeacherVideoURL = NSURL(string: "https://www.youtube.com/watch?v=gkVpNq4-wqs")
        Teacher4.TeacherImageURL = "阿滴"
        Teacher4.Languages = ["Chinese", "English", "Taiwanise"]
        Teacher4.StarScores = "⭐️⭐️"
        Teacher4.CommentNumber = "(99023)"
        Teacher4.Rate = "300 - 500 TWD/hour"
        Teacher4.TeacherBackground = ""
        Teacher4.Trail = "Yes"
        Teacher4.TeacherSelfIntro = ""
        
        let Teacher5: Teacher = Teacher()
        Teacher5.TeacherName = "阿滴"
        Teacher5.TeacherVideoURL = NSURL(string: "https://www.youtube.com/watch?v=gSbOa1SJ0TQ")
        Teacher5.TeacherImageURL = "阿滴"
        Teacher5.Languages = ["Chinese", "English", "Taiwanise"]
        Teacher5.StarScores = "⭐️⭐️⭐️"
        Teacher5.CommentNumber = "(114)"
        Teacher5.Rate = "250 - 400 TWD/hour"
        Teacher5.TeacherBackground = ""
        Teacher5.Trail = "Yes"
        Teacher5.TeacherSelfIntro = ""
        
        let Teacher6: Teacher = Teacher()
        Teacher6.TeacherName = "Minions"
        Teacher6.TeacherVideoURL = NSURL(string: "https://www.youtube.com/watch?v=sFukyIIM1XI")
        Teacher6.TeacherImageURL = "Bob_minions_hands"
        Teacher6.Languages = ["Chinese", "English", "Bananise"]
        Teacher6.StarScores = "⭐️⭐️⭐️⭐️⭐️"
        Teacher6.CommentNumber = "(332)"
        Teacher6.Rate = "120000 - 600000 TWD/hour"
        Teacher6.TeacherBackground = "Minions are small, yellow creatures who have existed since the beginning of time, evolving from single-celled organisms into beings who exist only to serve history's most despicable masters.[14] After serving a great deal of masters over the centuries (though they accidentally kill their masters most of the time), and a disastrous end to their service to Napoleon, the Minions are driven into isolation and decide to start a new life in a massive cave in Antarctica. After many years, the Minions become depressed, restless and unmotivated without a master to serve. To regain their dignity and sense of purpose, Kevin, one fearless Minion, decides to set out to find a new master and asks for help. Stuart, a musically inclined Minion and Bob, a young and inexperienced but infectious Minion, are recruited."
        Teacher6.Trail = "No"
        Teacher6.TeacherSelfIntro = "BANANA IS THE BEST!!"
        
        let Teacher7: Teacher = Teacher()
        Teacher7.TeacherName = "阿滴"
        Teacher7.TeacherVideoURL = NSURL(string: "https://www.youtube.com/watch?v=YUR38UEgjPE")
        Teacher7.TeacherImageURL = "阿滴"
        Teacher7.Languages = ["Chinese", "English", "Taiwanise"]
        Teacher7.StarScores = "⭐️⭐️⭐️⭐️"
        Teacher7.CommentNumber = "(689)"
        Teacher7.Rate = "300 - 500 TWD/hour"
        Teacher7.TeacherBackground = ""
        Teacher7.Trail = "Yes"
        Teacher7.TeacherSelfIntro = ""
        
        ArrayTeachers = [Teacher1, Teacher2, Teacher3, Teacher4, Teacher5, Teacher6, Teacher7]
    }
}
