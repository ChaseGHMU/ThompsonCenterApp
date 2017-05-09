//
//  ToiletTrainingViewController.swift
//  Thompson Center App
//
//  Created by Chase Allen on 4/13/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import UIKit

class ToiletTrainingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var passedName:String = ""
    let options: [String] = ["Accident", "Success", "Self-Initiated", "Other"]
    
    @IBOutlet weak var bowelMovementsTable: UITableView!
    @IBOutlet weak var urinationTable: UITableView!
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell?.accessoryType == .checkmark {
                cell?.accessoryType = .none
            } else {cell?.accessoryType = .checkmark}
        
        if cell?.accessoryType == .checkmark{
            let selectedOptions: [String] = [options[indexPath.row]]
            print(selectedOptions)
            }
            
    }
    
    @IBAction func submitToiletForm(_ sender: Any) {
        
    }
    
}
