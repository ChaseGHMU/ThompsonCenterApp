//
//  Child+CoreDataProperties.swift
//  Thompson Center App
//
//  Created by Chase Allen on 5/9/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import Foundation
import CoreData


extension Child {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Child> {
        return NSFetchRequest<Child>(entityName: "Child")
    }

    @NSManaged public var birthday: NSDate
    @NSManaged public var child_name: String
    @NSManaged public var doctor_name: String
    @NSManaged public var medication: String
    @NSManaged public var child_image: NSData?
    @NSManaged public var activity: Activities?

}
