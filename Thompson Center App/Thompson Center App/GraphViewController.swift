//
//  GraphViewController.swift
//  Thompson Center App
//
//  Created by Chase Allen on 5/3/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var graphView: GraphView!
    @IBOutlet weak var behaviorGraphView: BehaviorGraphView!
    
    var passedName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Graphs"
        // Do any additional setup after loading the view.
        graphView.passedName = passedName
        behaviorGraphView.passedName = passedName
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
