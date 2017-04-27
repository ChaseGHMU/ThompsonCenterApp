//
//  BehaviorViewController.swift
//  Thompson Center App
//
//  Created by Chase Allen on 4/13/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import UIKit
import CoreData

class BehaviorViewController: UIViewController {

    @IBOutlet var behaviorTextField: UITextField!
    @IBOutlet var severitySlider: UISlider!
    @IBOutlet var startDatePicker: UIDatePicker!
    @IBOutlet var endDatePicker: UIDatePicker!
    
    let context: NSManagedObjectContext = .shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // severitySlider.maximumValue = 100.0
        // Do any additional setup after loading the view.
    }
    
    @IBAction
    func submitPressed() {
//        let behavior = Behavior()
//        
//        behavior.behavior = behaviorTextField.text
//        behavior.severity = Int64(severitySlider.value)
//        behavior.start_time = startDatePicker.date as NSDate
//        behavior.end_time = endDatePicker.date as NSDate
//        
//        context.insert(behavior)
        navigationController!.popViewController(animated: true) // goes back
    }
}
