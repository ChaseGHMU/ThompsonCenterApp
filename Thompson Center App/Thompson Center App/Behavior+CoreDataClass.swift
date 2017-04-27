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
    
    var startTime:Date {
        get{
            return start_time as Date
        }
        set(newDate){
            start_time = startTime as NSDate
        }
    }
    
    var endTime:Date {
        get{
            return end_time as Date
        }
        set(newDate){
            end_time = endTime as NSDate
        }
    }
    
    convenience init?(startTime: Date, endTime: Date, severity: Int, behavior: String ) {
        guard let context = Model.sharedInstance.managedContext else { return nil }
        
        self.init(entity: Behavior.entity(), insertInto: context)
        
        self.startTime = startTime
        self.endTime = endTime
        self.severity = Int64(severity)
        self.behavior = behavior
    }
}
