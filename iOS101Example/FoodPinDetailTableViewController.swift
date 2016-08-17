//
//  FoodPinDetailTableViewController.swift
//  iOS101Example
//
//  Created by PiHan Hsu on 8/16/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit

class FoodPinDetailTableViewController: UITableViewController {

    var imageName = ""
    
    @IBOutlet var foodPinImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       //foodPinImageView.backgroundColor = UIColor.yellowColor()
       foodPinImageView.image = UIImage(named: imageName)
    }

}
