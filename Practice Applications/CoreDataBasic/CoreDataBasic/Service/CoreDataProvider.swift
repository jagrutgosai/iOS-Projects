//
//  CoreDataProvider.swift


import Foundation
import CoreData


protocol CoreDataProviderProtocol {

    func insert( context : NSManagedObjectContext ) -> UUID?
    
    func update( context : NSManagedObjectContext ) -> Bool
       
    func delete( context : NSManagedObjectContext ) -> Bool

}

    

class CoreDataProvider {
    
    
    static func all(context : NSManagedObjectContext, entityName : String, sortDescriptors : [NSSortDescriptor] = []) -> [Any?] {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        if sortDescriptors.count > 0 {
            request.sortDescriptors = sortDescriptors
        }
        
        do {
            let allObjects = try context.fetch(request)
            return allObjects
        } catch {
            print("**** EXCEPTION at CoreDataProvider.all **** \n \(error.localizedDescription)")
            return []
        }
    }
    
    
    
    static private func save( context : NSManagedObjectContext ) throws {
        
        do {
            try context.save()
        } catch {
            print("**** EXCEPTION at CoreDataProvider.save **** \n \(error.localizedDescription)")
            throw error
        }
       
    }
    
    
    static func insert( context : NSManagedObjectContext ) throws -> Bool {
        
        do {
            try save(context: context)
            return true
        } catch {
            print("**** EXCEPTION at CoreDataProvider.insert **** \n \(error.localizedDescription)")
            throw error
        }
        
    }
    
    static func update( context : NSManagedObjectContext ) throws -> Bool {
        
        do {
            try save(context: context)
            return true
        } catch {
            print("**** EXCEPTION at CoreDataProvider.update **** \n \(error.localizedDescription)")
            throw error
        }
        
    }
    

    
    static func delete( context : NSManagedObjectContext, objectToDelete : NSManagedObject ) throws -> Bool {
        
        context.delete(objectToDelete)
        
        do {
            try save(context: context)
            return true
        } catch {
            print("**** EXCEPTION at CoreDataProvider.delete **** \n \(error.localizedDescription)")
            throw error
        }
        
    }

    
    
}
