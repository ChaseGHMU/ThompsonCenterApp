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
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func createButton(_ sender: UIButton) {
        print(childBirthdayInput.date)
        if let childName = childNameInput.text,
            let doctorName = physicianNameInput.text,
            let meds = medicationInput.text {
            Child(date: childBirthdayInput.date, childName: childName, doctorName: doctorName, medication: meds)
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            self.navigationController?.popViewController(animated: true)
        }
    }

}
