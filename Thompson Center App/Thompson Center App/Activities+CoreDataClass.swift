//
//  Activities+CoreDataClass.swift
//  Thompson Center App
//
//  Created by Chase Allen on 4/27/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import Foundation
import CoreData

@objc(Activities)
public class Activities: NSManagedObject {
    var sleepArray:[Sleep]? {
        return self.sleep?.allObjects as? [Sleep]
    }
    
    var behaviorArray:[Behavior]? {
        return self.behavior?.allObjects as? [Behavior]
    }
    
    convenience init?(type: String, childName: String) {
        
        guard let context = Model.sharedInstance.managedContext else { return nil }
        
        self.init(entity: Activities.entity(), insertInto: context)
        
        self.type = type
        self.child_name = childName
    }
}
