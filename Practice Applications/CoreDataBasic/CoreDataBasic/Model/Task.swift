//
//  Task.swift
//  CoreDataBasic
//
//  Created by english on 2021-11-11.
//

import Foundation
import CoreData

@objc(Task)
public class Task: NSManagedObject {

}
extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var uuid: UUID?
    @NSManaged public var title: String?
    @NSManaged public var done: Bool

}

extension Task : Identifiable {

}
