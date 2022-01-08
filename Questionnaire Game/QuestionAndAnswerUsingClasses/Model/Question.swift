//
//  Question.swift
//  QuestionAndAnswerUsingClasses
//
//  Created by user203175 on 8/22/21.
//

import Foundation


class Question : Codable {
    
    public var question : String
    public var answer : Bool
    public var answerExtraInfo : String
    
    init(question : String, answer : Bool, answerExtraInfo : String) {
        self.question = question
        self.answer = answer
        self.answerExtraInfo = answerExtraInfo
    }
    
}

