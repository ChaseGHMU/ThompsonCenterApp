//
//    ToiletTrainingViewController.swift
//    Thompson Center App
//
//    Created by Chase Allen on 4/13/17.
//    Copyright © 2017 Chase J Allen. All rights reserved.
//

import UIKit
import CoreData

class ToiletTrainingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var passedName:String = ""
    let options: [String] = ["Accident", "Success", "Self-Initiated", "Other"]
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }()
    let date = Date()
    var urineSuccess:Bool = false
    var bowelSuccess:Bool = false
    
    @IBAction func updateSliderLabel(_ sender: Any) {
        let selectedValue = Int(accidentSlider.value)
        accidentLabel.text = String(selectedValue)
    }
    @IBOutlet weak var accidentSlider: UISlider!
    @IBOutlet weak var accidentLabel: UILabel!
    @IBOutlet weak var bowelMovementsTable: UITableView!
    @IBOutlet weak var urinationTable: UITableView!
    
    let context: NSManagedObjectContext = .shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Toilet Training"
        
        bowelMovementsTable.delegate = self
        bowelMovementsTable.dataSource = self
        bowelMovementsTable.register(UITableViewCell.self, forCellReuseIdentifier: "bowelCell")

        urinationTable.delegate = self
        urinationTable.dataSource = self
        urinationTable.register(UITableViewCell.self, forCellReuseIdentifier: "urinationCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        // create a new cell if needed or reuse an old one
        
        let bowelCell:UITableViewCell = bowelMovementsTable.dequeueReusableCell(withIdentifier: "bowelCell") as UITableViewCell!
        
        let urinationCell: UITableViewCell = urinationTable.dequeueReusableCell(withIdentifier: "urinationCell") as UITableViewCell!

        // set the text from the data model
        bowelCell.textLabel?.text = self.options[indexPath.row]
        urinationCell.textLabel?.text = self.options[indexPath.row]
        
        return bowelCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == bowelMovementsTable{
            return "Bowel Movement"
        }else{
            return "Urination"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        //LOGIC FOR ADDING AND REMOVING FROM SELECTEDOPTIONS ARRAY
        if tableView == bowelMovementsTable{
            if cell?.accessoryType == .checkmark {
                cell?.accessoryType = .none
                if options[indexPath.row] == "Success"{
                    bowelSuccess = false
                }
            } else {
                cell?.accessoryType = .checkmark
                if options[indexPath.row] == "Success"{
                    bowelSuccess = true
                }
            }
        }else{
            
            if cell?.accessoryType == .checkmark {
                cell?.accessoryType = .none
                if options[indexPath.row] == "Success"{
                    urineSuccess = false
                }
            } else {
                cell?.accessoryType = .checkmark
                if options[indexPath.row] == "Success"{
                    urineSuccess = true
                }
            }
        }
    }
    
    @IBAction func submitToiletForm(_ sender: Any) {
        let dateAdded = dateFormatter.string(from: date)
        let numAccidents = Int(accidentSlider.value)
        if let input = Toilet(name: passedName, date: dateAdded, numAccidents: numAccidents , urineSuccess: urineSuccess, bowelSucces: bowelSuccess){
            let activity = Activities(type: "Toilet Training", childName: passedName)
            context.insert(input)
            activity?.addToToilet(input)
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            navigationController!.popViewController(animated: true)
        }
        
    }
    
}
