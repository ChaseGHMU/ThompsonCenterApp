//
//  Sleep+CoreDataProperties.swift
//  Thompson Center App
//
//  Created by Chase Allen on 5/9/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import Foundation
import CoreData


extension Sleep {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sleep> {
        return NSFetchRequest<Sleep>(entityName: "Sleep")
    }

    @NSManaged public var child_name: String
    @NSManaged public var end_time: String
    @NSManaged public var start_time: String
    @NSManaged public var time_woken_up: Int64
    @NSManaged public var type: String
    @NSManaged public var date_added: String
    @NSManaged public var sleep_activity: Activities?

}
