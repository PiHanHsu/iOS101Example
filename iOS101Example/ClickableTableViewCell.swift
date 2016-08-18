//
//  ClickableTableViewCell.swift
//  iOS101Example
//
//  Created by PiHan Hsu on 8/17/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit

@objc protocol ClickableTableViewCellDelegate : class {
    func sayGoodBye()
    optional func sayHi()
}

class ClickableTableViewCell: UITableViewCell {
    weak var delegate: ClickableTableViewCellDelegate?
    
    @IBAction func sayHi(sender: AnyObject) {
        //print("hi")
        delegate?.sayHi?()
    }
    
    @IBAction func sayGoodBye(sender: AnyObject) {
        //print("good bye")
        delegate?.sayGoodBye()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
