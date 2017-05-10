//
//  Toilet+CoreDataProperties.swift
//  Thompson Center App
//
//  Created by Chase Allen on 5/10/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import Foundation
import CoreData


extension Toilet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Toilet> {
        return NSFetchRequest<Toilet>(entityName: "Toilet")
    }

    @NSManaged public var urine_success: Bool
    @NSManaged public var bowel_success: Bool
    @NSManaged public var child_name: String
    @NSManaged public var date_added: String
    @NSManaged public var type: String?
    @NSManaged public var num_accidents: Int64
    @NSManaged public var toilet_activity: Activities?

}
