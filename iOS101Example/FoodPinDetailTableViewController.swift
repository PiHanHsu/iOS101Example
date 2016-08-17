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
    var restaurantName = ""
   
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var restaurantNameLabel: UILabel!
    @IBOutlet var foodPinImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       //foodPinImageView.backgroundColor = UIColor.yellowColor()
       foodPinImageView.image = UIImage(named: imageName)
       restaurantNameLabel.text = restaurantName
        if restaurantName == "鼎泰豐" {
            descriptionLabel.text = "創立於 1958 年的鼎泰豐，在 1972 年由原來的食用油行轉型經營小籠包與麵點生意。開賣小籠包後，便用心專注於品質與服務的提升，來自四面八方的佳評如潮，並在各家美食報章雜誌的介紹下，漸入佳績，至今不僅是一般市民的最愛，更是許多政商名流、國際級影星讚不絕口指定必嚐的頂級美食。" 
        }
      
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }

}