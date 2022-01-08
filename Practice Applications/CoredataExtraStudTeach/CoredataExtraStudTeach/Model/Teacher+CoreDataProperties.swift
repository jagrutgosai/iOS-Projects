//
//  Teacher+CoreDataProperties.swift
//  CoredataExtraStudTeach
//
//  Created by english on 2021-11-18.
//
//

import Foundation
import CoreData


extension Teacher {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Teacher> {
        return NSFetchRequest<Teacher>(entityName: "Teacher")
    }

    @NSManaged public var name: String?
    @NSManaged public var uuid: UUID?
    @NSManaged public var course: String?

}

extension Teacher : Identifiable {

}
