//
//  QuizCell.swift
//  iQuiz
//
//  Created by Anushree Gopal on 10/29/18.
//  Copyright © 2018 Anushree Gopal. All rights reserved.
//

import Foundation

class Question {
    init(text: String, answer: Int, answers: [String]) {
        self.text = text
        self.answer = answer
        self.answers = answers
    }
    var text : String
    var answer : Int
    var answers : [String]
    
}

class Subject {
    init(title : String, description : String, questions : [Question]) {
        self.title = title
        self.desc = description
        self.questions = questions
    }
    var title = ""
    var desc = ""
    var questions : [Question]
}
