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
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }()
    
    let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
    
    let date = Date()
    var passedName:String = ""
    @IBOutlet var behaviorTextField: UITextField!
    @IBOutlet var severitySlider: UISlider!
    @IBOutlet var startDatePicker: UIDatePicker!
    @IBOutlet var endDatePicker: UIDatePicker!
    
    @IBOutlet weak var sliderLabel: UILabel!
    let context: NSManagedObjectContext = .shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Behaviors"
        sliderLabelConnection(severitySlider)
        
    }
    
    @IBAction func sliderLabelConnection(_ sender: Any) {
        let seletedValue = Int(severitySlider.value)
        sliderLabel.text = String(seletedValue)
    }
    
    @IBAction
    func submitPressed() {
        let dateAdded = dateFormatter.string(from: date)
        let startTime = timeFormatter.string(from: startDatePicker.date)
        let endTime = timeFormatter.string(from: endDatePicker.date)
        print(timeFormatter.string(from: startDatePicker.date))
        if let text = behaviorTextField.text{
            if text.isEmpty {
                let alert = UIAlertController(title: "Error", message: "All forms must be filled in.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else{
                if let input = Behavior(startTime: startTime, endTime: endTime, severity: Int(severitySlider.value), behavior: text, childName: passedName, dateAdded: dateAdded){
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
