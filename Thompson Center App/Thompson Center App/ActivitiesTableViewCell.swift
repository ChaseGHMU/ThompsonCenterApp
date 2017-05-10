//
//  ActivitiesTableViewCell.swift
//  Thompson Center App
//
//  Created by Miranda Reese on 5/7/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import UIKit

class ActivitiesTableViewCell: UITableViewCell {
    @IBOutlet weak var activity: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    override func prepareForReuse() {
        activity.text = nil
        date.text = nil
    }
}
