//
//  Model.swift
//  Thompson Center App
//
//  Created by Chase Allen on 4/13/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import UIKit
import CoreData

class Model {
    // MARK: - Properties
    var managedContext: NSManagedObjectContext?
    
    // MARK: Static
    static var sharedInstance: Model = Model()
    
    // MARK: - Initializer
    init() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let persistentContainer = appDelegate?.persistentContainer
        managedContext = persistentContainer?.viewContext
    }
    
    // MARK: - Core Data Functions
    func loadData() {
        let coreDataLoadedKey = "hasLoadedCoreData"
        
        guard !UserDefaults.standard.bool(forKey: coreDataLoadedKey) else { return }
        
        do {
            try self.managedContext?.save()
            
            UserDefaults.standard.set(true, forKey: coreDataLoadedKey)
        } catch {
            return
        }
    }
    
    func fetchSleep() -> [Sleep] {
        do {
            let array = try managedContext?.fetch(Sleep.fetchRequest()) ?? []
            return array
        } catch {
            return []
        }
    }
    
    func fetchToiletTraining() -> [Toilet] {
        do {
            let array = try managedContext?.fetch(Toilet.fetchRequest()) ?? []
            return array
        } catch {
            return []
        }
    }
    
    func fetchChildren() -> [Child] {
        do {
            let array = try managedContext?.fetch(Child.fetchRequest()) ?? []
            return array
        } catch {
            return []
        }
    }
    
    func fechBehavior() -> [Behavior] {
        do {
            let array = try managedContext?.fetch(Behavior.fetchRequest()) ?? []
            return array
        } catch {
            return []
        }
    }
    
    func fetchActivities() -> [Activities] {
        do {
            let array = try managedContext?.fetch(Activities.fetchRequest()) ?? []
            return array
        } catch {
            return []
        }
    }
    
    func saveContext() {
        guard let context = managedContext,
            context.hasChanges else { return }
        
        try? context.save()
    }
}
