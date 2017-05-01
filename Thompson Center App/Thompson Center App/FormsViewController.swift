//
//  FormsViewController.swift
//  Thompson Center App
//
//  Created by Chase Allen on 4/13/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import UIKit

class FormsViewController: UIViewController {
    var passedName:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Forms"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let behaviorDestination = segue.destination as? BehaviorViewController{
            behaviorDestination.passedName = passedName
        }
        if let sleepDestination = segue.destination as? SleepViewController{
            sleepDestination.passedName = passedName
        }
        if let toiletDestination = segue.destination as? ToiletTrainingViewController{
            toiletDestination.passedName = passedName
        }
    }

}
