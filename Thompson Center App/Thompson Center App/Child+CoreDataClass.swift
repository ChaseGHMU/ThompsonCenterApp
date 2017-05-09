//
//  Child+CoreDataClass.swift
//  Thompson Center App
//
//  Created by Chase Allen on 4/27/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import Foundation
import CoreData

@objc(Child)
public class Child: NSManagedObject {
    
    var date:Date {
        get{
            return birthday as Date
        }
        set(newDate){
            birthday = date as NSDate
        }
    }

    convenience init?(date: Date, childName: String, doctorName: String, medication: String) {
        guard let context = Model.sharedInstance.managedContext else { return nil }
        
        self.init(entity: Child.entity(), insertInto: context)
        
        self.date = date
        self.child_name = childName
        self.doctor_name = doctorName
        self.medication = medication
        
    }
}

