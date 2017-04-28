//
//  CreateNewChildControllerViewController.swift
//  Thompson Center App
//
//  Created by Chase Allen on 4/13/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import UIKit
import CoreData

class CreateNewChildControllerViewController: UIViewController {

    @IBOutlet weak var childNameInput: UITextField!
    @IBOutlet weak var childBirthdayInput: UIDatePicker!
    @IBOutlet weak var physicianNameInput: UITextField!
    @IBOutlet weak var medicationInput: UITextField!
    
    let context: NSManagedObjectContext = .shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func createButton(_ sender: UIButton) {
        if let childName = childNameInput.text,
            let doctorName = physicianNameInput.text,
            let meds = medicationInput.text {
            if let child = Child(date: childBirthdayInput.date, childName: childName, doctorName: doctorName, medication: meds){
                context.insert(child)
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            self.navigationController?.popViewController(animated: true)
        }
    }

}
