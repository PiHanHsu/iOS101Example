//
//  FoodPinTableViewCell.swift
//  iOS101Example
//
//  Created by PiHan Hsu on 8/16/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit

class FoodPinTableViewCell: UITableViewCell {


    
    @IBOutlet var foodPinImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    
    @IBOutlet var distanceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
