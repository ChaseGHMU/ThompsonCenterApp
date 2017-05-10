//
//  Behavior+CoreDataProperties.swift
//  Thompson Center App
//
//  Created by Chase Allen on 5/9/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import Foundation
import CoreData


extension Behavior {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Behavior> {
        return NSFetchRequest<Behavior>(entityName: "Behavior")
    }

    @NSManaged public var behavior: String
    @NSManaged public var child_name: String
    @NSManaged public var end_time: String
    @NSManaged public var severity: Int64
    @NSManaged public var start_time: String
    @NSManaged public var type: String
    @NSManaged public var date_added: String
    @NSManaged public var behavior_activity: Activities?

}
