//
//  Provider.swift
//  QuestionAndAnswerUsingClasses
//
//  Created by user203175 on 9/15/21.
//

import Foundation

class Provider {
    
    static var allQuestions : Array<Question> = loadQuestions()
    
    
    static func loadQuestions() -> Array<Question> {
        
        var questions : Array<Question> = []
        
        do{
            let path = Bundle.main.path(forResource: "QuestionsAboutCanada", ofType: "json") // file path for file "data.txt"
            let fileContent = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
            
            let jsonQuestions = Data(fileContent.utf8)
            let decoder = JSONDecoder()
            do{
                questions = try decoder.decode([Question].self, from: jsonQuestions)
            } catch {
                print(error.localizedDescription)
            }
            
        }catch{
            print("Error reading JSON file!")
        }
        return questions
    }
    
}
