//
//  OutbreakInfoViewController.swift
//  Thompson Center App
//
//  Created by Chase Allen on 4/13/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import UIKit

class OutbreakInfoViewController: UIViewController {
    var passedName = ""
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var graphView: GraphView!
    @IBOutlet weak var behaviorLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var graphDescriptionLabel: UILabel!
    
    var desLabel = ""
    var endTimeLabel = ""
    var startTimeLabel = ""
    var behaviorInfoLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = desLabel
        endTime.text = endTimeLabel
        startTime.text = startTimeLabel
        graphView.passedName = passedName
        graphView.activity = desLabel
        behaviorLabel.text = behaviorInfoLabel
        setupGraph()
        // Do any additional setup after loading the view.
    }
    
    func setupGraph(){
        maxLabel.text = "\(String(describing: graphView.maxNum))"
        if desLabel == "Sleep"{
            graphDescriptionLabel.text = "Number of times woken up"
        }else if desLabel == "Behavior"{
            graphDescriptionLabel.text = "Severity"
        }
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

}
