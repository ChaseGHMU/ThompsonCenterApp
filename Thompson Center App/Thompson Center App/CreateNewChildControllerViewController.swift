//
//  CreateNewChildControllerViewController.swift
//  Thompson Center App
//
//  Created by Chase Allen on 4/13/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import UIKit

class CreateNewChildControllerViewController: UIViewController {

    @IBOutlet weak var childNameInput: UITextField!
    @IBOutlet weak var childBirthdayInput: UIDatePicker!
    @IBOutlet weak var physicianNameInput: UITextField!
    @IBOutlet weak var medicationInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Add Child"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func createButton(_ sender: UIButton) {
        
        if let childName = childNameInput.text,
            let doctorName = physicianNameInput.text,
            let meds = medicationInput.text {
            let child = ChildStruct(childName: childName, birthDate: childBirthdayInput.date, doctorName: doctorName, medication: meds)
            Data.sharedInstance.children.append(child)
            self.navigationController?.popViewController(animated: true)
        }
    }

}
