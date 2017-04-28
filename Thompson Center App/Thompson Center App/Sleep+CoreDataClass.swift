//
//  Sleep+CoreDataClass.swift
//  Thompson Center App
//
//  Created by Chase Allen on 4/27/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import Foundation
import CoreData

@objc(Sleep)
public class Sleep: NSManagedObject {
    
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
    
    convenience init?(startTime: Date, endTime: Date, timeWokenUp: Int ) {
        guard let context = Model.sharedInstance.managedContext else { return nil }
        
        self.init(entity: Sleep.entity(), insertInto: context)
        
        self.startTime = startTime
        self.endTime = endTime
        self.time_woken_up = Int64(timeWokenUp)
        self.type = "Sleep"
    }
    
}
