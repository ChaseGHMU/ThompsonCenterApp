//
//  ChildTableViewController.swift
//  Thompson Center App
//
//  Created by Chase Allen on 4/13/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import UIKit

class ChildTableViewController: UITableViewController {
    
    var childrenArray = [ChildStruct]()
    
    @IBOutlet var ChildTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Children"
        ChildTableView.dataSource = self;
        ChildTableView.delegate = self;
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Refresh the table with all the data from sharedInstance
        
        childrenArray = Data.sharedInstance.children
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return childrenArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = childrenArray[indexPath.row].childName
        cell.backgroundColor = .clear
        
        // Configure the cell...
        
        return cell
    }
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? BehaviorsViewController,
            let row = ChildTableView.indexPathForSelectedRow?.row {
                print(childrenArray[row].childName)
                destination.passedName = childrenArray[row].childName
            }
    }
}
