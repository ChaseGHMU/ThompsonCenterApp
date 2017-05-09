//
//  Behavior+CoreDataClass.swift
//  Thompson Center App
//
//  Created by Chase Allen on 4/27/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import Foundation
import CoreData

@objc(Behavior)
public class Behavior: NSManagedObject {
//    @NSManaged public var behavior: String?
//    @NSManaged public var end_time: NSDate?
//    @NSManaged public var severity: Int64
//    @NSManaged public var start_time: NSDate?


    convenience init?(startTime:String, endTime: String, severity: Int, behavior: String, childName: String, dateAdded: String) {
        guard let context = Model.sharedInstance.managedContext else { return nil }
        
        self.init(entity: Behavior.entity(), insertInto: context)
        
        self.start_time = startTime
        self.end_time = endTime
        self.severity = Int64(severity)
        self.behavior = behavior
        self.type = "Behavior"
        self.child_name = childName
        self.date_added = dateAdded
    }
}
