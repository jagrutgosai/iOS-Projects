//
//  Student.swift
//  CoredataExtraStudTeach
//
//  Created by english on 2021-11-16.
//

import Foundation
import CoreData
extension Student : CoreDataProviderProtocol{
    static let entityName : String = "Student"
    static func all(context: NSManagedObjectContext) ->[Student]{
      return  CoreDataProvider.all(context: context, entityName: Student.entityName) as! [Student]
    }
   
    static func allByName(context: NSManagedObjectContext) ->[Student]{
        let sortByName = NSSortDescriptor(key: "name", ascending: true)
        return  CoreDataProvider.all(context: context, entityName: Student.entityName, sortDescriptors: [sortByName] ) as! [Student]
    }
    func save(context: NSManagedObjectContext) -> UUID? {
        // Insert or Update
        if self.uuid == nil{
            self.uuid = UUID()
        }
        do {
            try CoreDataProvider.save(context: context)
            return self.uuid
        }catch{
            print(error.localizedDescription)
            return nil
        }
      
        
    }
    
    func delete(context: NSManagedObjectContext) -> Bool {
        
        do {
            return try CoreDataProvider.delete(context: context, objectToDelete: self)
            
        }catch{
            print(error.localizedDescription)
            return false
        }
        
    }
    
    
}
