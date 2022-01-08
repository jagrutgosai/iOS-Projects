//
//  StudentProvider.swift
//  Review_2031152
//
//  Created by english on 2021-10-19.
//

import Foundation

class StudentProvider {
    
    static var allStudents : [Student] = []
    
    
   //Add Student
    static func addStudent(student : Student){
        
        allStudents.append(student)
        
    }
    
    //Delete Student
    static func removeStudent (sid : Int) -> Bool{
        
        for(index, student) in allStudents.enumerated(){
            
        
            if student.id == sid  {
                allStudents.remove(at: index)
            return true
        }
        
    }
            return false
        
    }
    
    // Update Student
    static func updateStudent ( updatedStudent : Student)-> Bool{
        for(index, student) in allStudents.enumerated(){
            
            if updatedStudent.id == student.id  {
                allStudents[index] = updatedStudent
            return true
        }
        
    }
            return false
        
        
        
    }
    
    
}
