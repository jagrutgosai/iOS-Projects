//
//  Student+CoreDataProperties.swift
//  CoredataExtraStudTeach
//
//  Created by english on 2021-11-16.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var uuid: UUID?
    @NSManaged public var name: String?
    @NSManaged public var email: String?

}

extension Student : Identifiable {

}
