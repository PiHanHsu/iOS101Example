//
//  ImageListViewController.swift
//  UIElementExample
//
//  Created by PiHan Hsu on 8/5/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit

class ImageListViewController: UIViewController {

    @IBOutlet var imageViewAspectFill: UIImageView!
    @IBOutlet var switchButton: UISwitch!
    @IBOutlet var locationSegmentedControl: UISegmentedControl!
    @IBOutlet var cityImaggView: UIImageView!
    
    var imageName = "San_Francisco"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func switchButton(sender: AnyObject) {
        if switchButton.on {
            imageViewAspectFill.clipsToBounds = true
        }else {
            imageViewAspectFill.clipsToBounds = false
        }
    }
    
    
    @IBAction func locationSegmentedControlChanged(sender: AnyObject) {
        switch locationSegmentedControl.selectedSegmentIndex {
        case 0:
            cityImaggView.image = UIImage(named: "San_Francisco")
            imageName = "San_Francisco"
        case 1:
            cityImaggView.image = UIImage(named: "NYC")
            imageName = "NYC"
        case 2:
            cityImaggView.image = UIImage(named: "Taipei")
            imageName = "Taipei"
        default:
            cityImaggView.image = UIImage(named: "San_Francisco")
        }
        
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowImageDetail" {
            let vc = segue.destinationViewController as! ImageDetailViewController
            vc.imageName = imageName
            
        }
    }

}
