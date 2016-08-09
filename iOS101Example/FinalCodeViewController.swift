//
//  FinalCodeViewController.swift
//  iOS101Example
//
//  Created by PiHan Hsu on 8/9/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit

class FinalCodeViewController: UIViewController {
    
    @IBOutlet var inputNumberTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    var finalCode: Int?
    var inputCode: Int?
    var topCode: Int = 0
    var bottomCode: Int = 0
    
    @IBOutlet var resetButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        createFinalCode()
    }
    
    func createFinalCode() {
        finalCode = Int(arc4random_uniform(UInt32(100))+1)
        topCode = 100
        bottomCode = 0
        resetButton.enabled = false
        resultLabel.text = "請猜1~99 任一數字"
    }
    
    @IBAction func confirmButtonPressed(sender: AnyObject) {
        inputCode = Int(inputNumberTextField.text!)
        
        if inputCode == finalCode {
            resultLabel.text = "猜中了！"
            resetButton.enabled = true
        }else if inputCode > finalCode {
            topCode = inputCode!
            displayResultLabel()
        }else if inputCode < finalCode {
            bottomCode = inputCode!
            displayResultLabel()
        }
        
        inputNumberTextField.text = ""
        
    }
    
    func displayResultLabel() {
        resultLabel.text = "\(bottomCode) < \(topCode)"
    }
    
    @IBAction func resetButtonPressed(sender: AnyObject) {
        createFinalCode()
    }
    
    //TODO 1: Adjust Layout to make it look better
    //hint: Adjust the font size, color, position,...
    
    //TODO 2: Create a player list and a label to show which player is guessing
    // the playing player should be a circle, ex: 1 -> 2 -> 3 -> 1 -> 2
    // every single game can have a new order.
    
    //TODO 3: The Result label should show who is the loser
    //Advance -> use alertController
    
    //TODO 4: Display how many numbers players can guess
    
    //TODO *: Use your creation to add more fun features
    
    
    //Optional TODOs:
    
    //TODO 5: When start a new game, system will sheffle the player list
    
    //TODO 6: Each player can have 2 crads "return" / "pass"
    //        Each card can be used one time in a game.
    
    

}
