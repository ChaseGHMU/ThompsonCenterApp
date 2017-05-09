//
//  CreateNewChildControllerViewController.swift
//  Thompson Center App
//
//  Created by Chase Allen on 4/13/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class CreateNewChildControllerViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var childNameInput: UITextField!
    @IBOutlet weak var childBirthdayInput: UIDatePicker!
    @IBOutlet weak var physicianNameInput: UITextField!
    @IBOutlet weak var medicationInput: UITextField!
    @IBOutlet weak var childPicture: UIImageView!
    @IBOutlet weak var uploadPicButton: UIButton!
    let context: NSManagedObjectContext = .shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Child"
        
        if let font = UIFont(name: "HelveticaNeue", size: 20){
            self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: font]
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func uploadImage(_ sender: Any) {
    
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        //Can change photoLibrary to Camera if we prefer
        
        image.allowsEditing = false
        
        self.present(image, animated: true) {
            
        }
        
    
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as! UIImage!{
            childPicture.image = image
        }
        
        else {
            //error
        }

        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
    @IBAction func createButton(_ sender: UIBarButtonItem) {
        
        if let childName = childNameInput.text,
        let doctorName = physicianNameInput.text,
        let meds = medicationInput.text,
        let imageData = UIImagePNGRepresentation(childPicture.image!) as NSData? {
            if childName.isEmpty || doctorName.isEmpty || meds.isEmpty{
                let alert = UIAlertController(title: "Error", message: "All forms must be filled in.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                if let child = Child(date: childBirthdayInput.date, childName: childName, doctorName: doctorName, medication: meds, childImage: imageData){
                    context.insert(child)
                    (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                    self.dismiss(animated: true, completion: nil)
                }//end child if
            } //end else
        }//end whole if
    }
}

