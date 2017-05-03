//
//  ChildTableViewController.swift
//  Thompson Center App
//
//  Created by Chase Allen on 4/13/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import UIKit
class ChildTableViewController: UITableViewController {
    
    var child: [Child] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Children"
        
        let backgroundImage = UIImageView(image: UIImage(named: "newThompsonImage.png"))
        backgroundImage.contentMode = .scaleAspectFit
        self.tableView.backgroundView = backgroundImage
        
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = child[indexPath.row].child_name
        cell.backgroundColor = .clear
        
        // Configure the cell...
        
        return cell
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? BehaviorsViewController{
            if let selectedRow = tableView.indexPathForSelectedRow {
                destination.passedName = child[selectedRow.row].child_name
            }
        }
    }
}
