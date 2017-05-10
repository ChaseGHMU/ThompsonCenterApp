//
//  BehaviorsViewController.swift
//  Thompson Center App
//
//  Created by Chase Allen on 4/26/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import UIKit

class BehaviorsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }()
    let date = Date()
    var passedName:String = ""
    var doctor = ""
    var medicine = ""
    var image: UIImage?
    var activities: [Activities] = []

    @IBOutlet weak var doctorLabel: UILabel!
    @IBOutlet weak var medicineLabel: UILabel!
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var addFormButton: UIButton!
    @IBOutlet weak var behaviorsTableView: UITableView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var childImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        behaviorsTableView.delegate = self
        behaviorsTableView.dataSource = self
        self.title = "Activities"
        self.navigationItem.rightBarButtonItem = addButton
        let backgroundImage = UIImageView(image: UIImage(named: "ThompsonBackgroundImage.png"))
        backgroundImage.contentMode = .scaleAspectFit
        behaviorsTableView.backgroundView = backgroundImage

        name.text = passedName
        medicineLabel.text = medicine
        doctorLabel.text = doctor
        childImageView.image = image
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        activities = Model.sharedInstance.fetchActivities()
        behaviorsTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return activities.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //We only want the symptoms of this exact child, not everyone
        if(activities[section].child_name == passedName){return 1}
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "behaviorCell", for: indexPath) as! ActivitiesTableViewCell
        
        //display Sleep if it exists in this spot
        if activities[indexPath.section].sleepArray?.count == 1 {
            if let sleep = activities[indexPath.section].sleepArray?[indexPath.row]{
                cell.activity.text = sleep.type
                cell.date.text = sleep.date_added
                cell.backgroundColor = .clear
            }
        }

        //display Behavior if it exists in this spot
        if activities[indexPath.section].behaviorArray?.count == 1{
                if let behavior = activities[indexPath.section].behaviorArray?[indexPath.row]{
                    cell.activity.text = behavior.behavior
                    cell.date.text = behavior.date_added
                    cell.backgroundColor = .clear
                }
        }
        //display Toilet if it exists in this spot
        if activities[indexPath.section].toiletArray?.count == 1{
            if let toilet = activities[indexPath.section].toiletArray?[indexPath.row]{
                cell.activity.text = toilet.type
                cell.date.text = toilet.date_added
                cell.backgroundColor = .clear
            }
        }
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? OutbreakInfoViewController,
        let selectedRow = behaviorsTableView.indexPathForSelectedRow{
            
            if activities[selectedRow.section].sleepArray?.count == 1{
                if let activity = activities[selectedRow.section].sleepArray?[selectedRow.row]{
                    destination.desLabel = activity.type
                    destination.endTimeLabel = activity.end_time
                    destination.startTimeLabel = activity.start_time
                    destination.passedName = passedName
                }//end if let
            }//end if
            
            if activities[selectedRow.section].behaviorArray?.count == 1 {
                if let behavior = activities[selectedRow.section].behaviorArray?[selectedRow.row]{
                        destination.desLabel = behavior.type
                        destination.behaviorInfoLabel = behavior.behavior
                        destination.endTimeLabel = behavior.end_time
                        destination.startTimeLabel = behavior.start_time
                        destination.passedName = passedName
                }//end if let
            }//end if
            
            if activities[selectedRow.section].toiletArray?.count == 1 {
                if let behavior = activities[selectedRow.section].toiletArray?[selectedRow.row]{
                    destination.desLabel = behavior.type!
                    destination.endTimeLabel = String(behavior.urine_success)
                    destination.startTimeLabel = String(behavior.bowel_success)
                    destination.passedName = passedName
                }//end if let
            }//end if
            
        }//end destination segue
        
        if let formDestination = segue.destination as? FormsViewController{
            formDestination.passedName = passedName
        }
    }

}

