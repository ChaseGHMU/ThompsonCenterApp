//
//  Toilet+CoreDataClass.swift
//  Thompson Center App
//
//  Created by Chase Allen on 5/10/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import Foundation
import CoreData

@objc(Toilet)
public class Toilet: NSManagedObject {
    convenience init?(name:String, date:String, numAccidents:Int, urineSuccess: Bool, bowelSucces:Bool){
        guard let context = Model.sharedInstance.managedContext else { return nil }
        
        self.init(entity: Toilet.entity(), insertInto: context)
        
        self.child_name = name
        self.date_added = date
        self.type = "Toilet Training"
        self.num_accidents = Int64(numAccidents)
        self.urine_success = urineSuccess
        self.bowel_success = bowelSucces
    }
}
