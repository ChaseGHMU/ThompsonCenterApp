//
//  Sleep+CoreDataProperties.swift
//  Thompson Center App
//
//  Created by Chase Allen on 4/27/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import Foundation
import CoreData


extension Sleep {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sleep> {
        return NSFetchRequest<Sleep>(entityName: "Sleep")
    }

    @NSManaged public var end_time: NSDate
    @NSManaged public var start_time: NSDate
    @NSManaged public var time_woken_up: Int64
    @NSManaged public var sleep_activity: Activities?

}
