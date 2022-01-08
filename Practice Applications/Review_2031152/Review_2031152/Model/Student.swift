//
//  Student.swift
//  Review_2031152
//
//  Created by english on 2021-10-19.
//

import Foundation

class Student{
    
    public var id : Int = 0
    public var name : String = ""
    
    //It will play the role like AUTOINCREMENT on DBs
    static private var idGenerator : Int = 0
    
    internal init(id: Int = 0, name: String = "") {
        self.id = id
        self.name = name
    }
    
    static  func getNextId ()-> Int {
        Student.idGenerator += 1
        return Student.idGenerator
    }
    
    
    
    
    
    
    
}
