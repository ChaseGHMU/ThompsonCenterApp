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
    var passedName:String = ""
    @IBOutlet var behaviorTextField: UITextField!
    @IBOutlet var severitySlider: UISlider!
    @IBOutlet var startDatePicker: UIDatePicker!
    @IBOutlet var endDatePicker: UIDatePicker!
    
    @IBOutlet weak var sliderLabel: UILabel!
    let context: NSManagedObjectContext = .shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction
    func submitPressed() {
        if let text = behaviorTextField.text{
            if text.isEmpty {
                let alert = UIAlertController(title: "Error", message: "All forms must be filled in.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else{
                if let input = Behavior(startTime: startDatePicker.date, endTime: endDatePicker.date, severity: Int(severitySlider.value), behavior: text, childName: passedName){
                    let activity = Activities(type: "Behavior", childName: passedName)
                    context.insert(input)
                    activity?.addToBehavior(input)
                    (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                    navigationController!.popViewController(animated: true)
                    
                }
            }
        }
    }
}
