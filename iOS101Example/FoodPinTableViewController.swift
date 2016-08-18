//
//  FoodPinTableViewController.swift
//  iOS101Example
//
//  Created by PiHan Hsu on 8/16/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit

class FoodPinTableViewController: UITableViewController {

    var restaurantNameArray = ["鼎泰豐", "游壽司", "新天堂義大利麵", "竹里館"]
    var restaurantTypeArray = ["點心小吃", "日本料理", "義大利麵", "特色台菜"]
    var locationArray = ["台北市信義區二段194號", "台北市大安區麗水街7巷7號","台北市大安區師大路59巷8號", "台北市中山區台北市松江路182號2樓"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.registerNib(UINib(nibName: "FoodPinTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodPinTableViewCell")
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return restaurantNameArray.count
        case 1:
            return 1
        default:
            break
        }
        return 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("FoodPinTableViewCell", forIndexPath: indexPath) as! FoodPinTableViewCell
            cell.foodPinImageView.image = UIImage(named: restaurantNameArray[indexPath.row])
            cell.foodPinImageView.layer.cornerRadius = 8.0
            cell.foodPinImageView.clipsToBounds = true
            cell.nameLabel.text = restaurantNameArray[indexPath.row]
            cell.typeLabel.text = restaurantTypeArray[indexPath.row]
            cell.locationLabel.text = locationArray[indexPath.row]
            cell.distanceLabel.text = "0.2km"
            return cell
        case 1:
             let cell = tableView.dequeueReusableCellWithIdentifier("ClickableTableViewCell", forIndexPath: indexPath) as! ClickableTableViewCell
             cell.delegate = self
             return cell
        default:
            break
        }
        
        return UITableViewCell()
        
    }
    

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("ShowFoodPinDetail", sender: self)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            restaurantNameArray.removeAtIndex(indexPath.row)
            restaurantTypeArray.removeAtIndex(indexPath.row)
            locationArray.removeAtIndex(indexPath.row)
        }
        
        tableView.reloadData()
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowFoodPinDetail" {
            let vc = segue.destinationViewController as! FoodPinDetailTableViewController
            vc.imageName = restaurantNameArray[(tableView.indexPathForSelectedRow?.row)!]
            vc.restaurantName = restaurantNameArray[(tableView.indexPathForSelectedRow?.row)!]
        }
        
    }
}

extension FoodPinTableViewController: ClickableTableViewCellDelegate {
    
    func sayHi() {
        print("Hi")
    }
    
    func sayGoodBye() {
        print("Goodbye")
    }
    
}
