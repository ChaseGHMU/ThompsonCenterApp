//
//  SleepViewController.swift
//  Thompson Center App
//
//  Created by Chase Allen on 4/13/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import UIKit
import CoreData


class SleepViewController: UIViewController {
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
    var passedName: String = ""
    @IBOutlet weak var startDate: UIDatePicker!
    @IBOutlet weak var endDate: UIDatePicker!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var timesWokenUpSlider: UISlider!
    
    let context: NSManagedObjectContext = .shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderLabelConnection(timesWokenUpSlider)
        self.title = "Sleep"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderLabelConnection(_ sender: Any) {
        let seletedValue = Int(timesWokenUpSlider.value)
        sliderLabel.text = String(seletedValue)
        
    }
    
    @IBAction func submitData(_ sender: Any) {
        if let wTimes = Int(sliderLabel.text!){
            let currentDate = dateFormatter.string(from: date)
            let activities = Activities(type: "Sleep", childName: passedName)
            let startTime = timeFormatter.string(from: startDate.date)
            let endTime = timeFormatter.string(from: endDate.date)
            if let sleep = Sleep(startTime: startTime, endTime: endTime, timeWokenUp: wTimes, childName: passedName, dateAdded: currentDate) {
                context.insert(sleep)
                activities?.addToSleep(sleep)
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            self.navigationController?.popViewController(animated: true)
        }
    }
    
        
        
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
