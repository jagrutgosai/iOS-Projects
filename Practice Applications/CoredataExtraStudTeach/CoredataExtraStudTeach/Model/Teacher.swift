//
//  Teacher.swift
//  CoredataExtraStudTeach
//
//  Created by english on 2021-11-18.
//

import Foundation
import CoreData
extension Teacher :CoreDataProviderProtocol {
    
    
    static let entityName : String = "Teacher"
    static func all(context: NSManagedObjectContext) ->[Teacher]{
      return  CoreDataProvider.all(context: context, entityName: Teacher.entityName) as! [Teacher]
    }
   
    static func allByName(context: NSManagedObjectContext) ->[Teacher]{
        let sortByName = NSSortDescriptor(key: "name", ascending: true)
        return  CoreDataProvider.all(context: context, entityName: Teacher.entityName, sortDescriptors: [sortByName] ) as! [Teacher]
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
