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
    
    convenience init?(startTime: String, endTime:String, timeWokenUp: Int, childName: String, dateAdded: String ) {
        guard let context = Model.sharedInstance.managedContext else { return nil }
        
        self.init(entity: Sleep.entity(), insertInto: context)
        
        self.start_time = startTime
        self.end_time = endTime
        self.time_woken_up = Int64(timeWokenUp)
        self.type = "Sleep"
        self.child_name = childName
        self.date_added = dateAdded
    }
    
}
