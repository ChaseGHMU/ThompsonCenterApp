//
//  ChildTableViewCell.swift
//  Thompson Center App
//
//  Created by Miranda Reese on 5/7/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import UIKit

class ChildTableViewCell: UITableViewCell {
    @IBOutlet weak var childImage: UIImageView!
    @IBOutlet weak var childName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        childImage.image = nil
        childName.text = nil
    }
}
