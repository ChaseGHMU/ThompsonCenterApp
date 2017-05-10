//
//  Activities+CoreDataProperties.swift
//  Thompson Center App
//
//  Created by Chase Allen on 5/10/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import Foundation
import CoreData


extension Activities {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Activities> {
        return NSFetchRequest<Activities>(entityName: "Activities")
    }

    @NSManaged public var child_name: String?
    @NSManaged public var type: String?
    @NSManaged public var behavior: NSSet?
    @NSManaged public var child: Child?
    @NSManaged public var sleep: NSSet?
    @NSManaged public var toilet: NSSet?

}

// MARK: Generated accessors for behavior
extension Activities {

    @objc(addBehaviorObject:)
    @NSManaged public func addToBehavior(_ value: Behavior)

    @objc(removeBehaviorObject:)
    @NSManaged public func removeFromBehavior(_ value: Behavior)

    @objc(addBehavior:)
    @NSManaged public func addToBehavior(_ values: NSSet)

    @objc(removeBehavior:)
    @NSManaged public func removeFromBehavior(_ values: NSSet)

}

// MARK: Generated accessors for sleep
extension Activities {

    @objc(addSleepObject:)
    @NSManaged public func addToSleep(_ value: Sleep)

    @objc(removeSleepObject:)
    @NSManaged public func removeFromSleep(_ value: Sleep)

    @objc(addSleep:)
    @NSManaged public func addToSleep(_ values: NSSet)

    @objc(removeSleep:)
    @NSManaged public func removeFromSleep(_ values: NSSet)

}

// MARK: Generated accessors for toilet
extension Activities {

    @objc(addToiletObject:)
    @NSManaged public func addToToilet(_ value: Toilet)

    @objc(removeToiletObject:)
    @NSManaged public func removeFromToilet(_ value: Toilet)

    @objc(addToilet:)
    @NSManaged public func addToToilet(_ values: NSSet)

    @objc(removeToilet:)
    @NSManaged public func removeFromToilet(_ values: NSSet)

}
