//
//  BehaviorsViewController.swift
//  Thompson Center App
//
//  Created by Chase Allen on 4/26/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import UIKit

class BehaviorsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var passedName:String?
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }()
    var activities: [Activities] = []
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var addFormButton: UIButton!
    @IBOutlet weak var behaviorsTableView: UITableView!
    @IBOutlet weak var name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        behaviorsTableView.delegate = self
        behaviorsTableView.dataSource = self
        self.title = "Activities"
        self.navigationItem.rightBarButtonItem = addButton
        
        let backgroundImage = UIImageView(image: UIImage(named: "newThompsonImage.png"))
        backgroundImage.contentMode = .scaleAspectFit
        behaviorsTableView.backgroundView = backgroundImage
        
        name.text = passedName
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
            print(activities[section].sleepArray?.count ?? 0)
            return activities[section].sleepArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "behaviorCell", for: indexPath)
        
        if let sleep = activities[indexPath.section].sleepArray?[indexPath.row]{
            cell.textLabel?.text = sleep.type
            cell.backgroundColor = .clear
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(activities[indexPath.row])
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? OutbreakInfoViewController {
            if let selectedRow = behaviorsTableView.indexPathForSelectedRow,
                let activity = activities[selectedRow.section].sleepArray?[selectedRow.row]{
                destination.desLabel = activity.type
                destination.endTimeLabel = dateFormatter.string(from: activity.endTime)
                destination.startTimeLabel = dateFormatter.string(from: activity.endTime)
            }
        }
    }

}

