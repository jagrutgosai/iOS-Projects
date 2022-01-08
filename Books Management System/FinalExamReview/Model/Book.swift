//
//  Book.swift
//  FinalExamReview
//
//  Created by english on 2021-12-06.
//

import Foundation

import CoreData

extension Book : CoreDataProviderProtocol{
    static let entityName = "Book"
    
    static func all(context: NSManagedObjectContext) -> [Book]{
      return  CoreDataProvider.all(context: context, entityName: entityName) as! [Book]
    }
    
    
    func delete(context: NSManagedObjectContext) -> Bool {
        do{
         return   try  CoreDataProvider.delete(context: context, objectToDelete: self)
            
        }catch{
            return false
        }
        
    }
    
    func save(context: NSManagedObjectContext) -> UUID? {
        if self.uuid == nil {
            // New Book
            self.uuid = UUID()
        }
        do{
            try CoreDataProvider.save(context: context)
            return self.uuid
        }catch{
            return nil
        }
    
    
    
}
}
