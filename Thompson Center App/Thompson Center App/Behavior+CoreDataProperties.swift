//
//  Behavior+CoreDataProperties.swift
//  Thompson Center App
//
//  Created by Chase Allen on 4/27/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import Foundation
import CoreData


extension Behavior {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Behavior> {
        return NSFetchRequest<Behavior>(entityName: "Behavior")
    }

    @NSManaged public var behavior: String?
    @NSManaged public var end_time: NSDate
    @NSManaged public var severity: Int64
    @NSManaged public var start_time: NSDate
    @NSManaged public var behavior_activity: Activities?

}
