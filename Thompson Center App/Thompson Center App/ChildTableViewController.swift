//
//  ChildTableViewController.swift
//  Thompson Center App
//
//  Created by Chase Allen on 4/13/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import UIKit
import Foundation

class ChildTableViewController: UITableViewController {
    
    var child: [Child] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Children"
        
        let backgroundImage = UIImageView(image: UIImage(named: "ThompsonBackgroundImage.png"))
        backgroundImage.contentMode = .scaleAspectFit
        self.tableView.backgroundView = backgroundImage
        
        child = Model.sharedInstance.fetchChildren()
        if self.child.count ==  0{
            let alert = UIAlertController(title: "Warning", message: "You have no children added. Please add a child.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 20)!]
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            child = (try? context.fetch(Child.fetchRequest())) ?? []
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        child = Model.sharedInstance.fetchChildren()
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return child.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChildTableViewCell
        
        cell.childName.text = child[indexPath.row].child_name
        cell.backgroundColor = .clear
        cell.accessoryType = .disclosureIndicator
        
        if let imageNSData = child[indexPath.row].child_image {
            let imageData = imageNSData as Data
            let childImage = UIImage(data: imageData)
            cell.childImage.image = childImage
        }
        
        return cell
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? BehaviorsViewController{
            if let selectedRow = tableView.indexPathForSelectedRow {
                destination.passedName = child[selectedRow.row].child_name
                destination.medicine = child[selectedRow.row].medication
                destination.doctor = child[selectedRow.row].doctor_name
                if let imageNSData = child[selectedRow.row].child_image {
                    let imageData = imageNSData as Data
                    let childImage = UIImage(data: imageData)
                    destination.image = childImage
                }
                
            }
        }
    }
}
