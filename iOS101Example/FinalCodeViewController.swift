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
    
    @IBOutlet var playerImageView: UIImageView!
    
    var finalCode: Int?
    var inputCode: Int?
    var topCode: Int = 0
    var bottomCode: Int = 0
    
    var playerList = ["Alex", "Jeff", "YoMing", "PiHan", "George", "Crystal"]
    var playerIndex = 0
    
    @IBOutlet var remainingNumberLable: UILabel!
    @IBOutlet var playerNameLabel: UILabel!
    
    @IBOutlet var nextPlayerNameLabel: UILabel!
    @IBOutlet var nextPlayerImageView: UIImageView!
    
    @IBOutlet var resetButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up playerImageView
        playerImageView.layer.cornerRadius = 30.0
        playerImageView.clipsToBounds = true
        nextPlayerImageView.layer.cornerRadius = 30.0
        nextPlayerImageView.clipsToBounds = true
        
        createFinalCode()
    }
    
    func createFinalCode() {
        finalCode = Int(arc4random_uniform(UInt32(100))+1)
        topCode = 100
        bottomCode = 0
        resetButton.enabled = false
        resultLabel.text = "0 < 100"
        playerIndex = Int(arc4random_uniform(UInt32(playerList.count)))
        
        displayPlayerInfo()
    }
    
    @IBAction func confirmButtonPressed(sender: AnyObject) {
        inputCode = Int(inputNumberTextField.text!)
        inputNumberTextField.text = ""
        
        if inputCode == finalCode {
            let title = "\(playerList[playerIndex]) 你輸了！"
            let alert = UIAlertController(title: title, message: "請接受處罰", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            let newGame = UIAlertAction(title: "New Game", style: .Default, handler: { (UIAlertAction) in
                self.createFinalCode()
            })
            alert.addAction(okAction)
            alert.addAction(newGame)
            presentViewController(alert, animated: true, completion: nil)
            resultLabel.text = String(finalCode!)
            remainingNumberLable.text = "0"
            resetButton.enabled = true
            return
        }else if inputCode > topCode || inputCode < bottomCode {
            let alert = UIAlertController(title: "數字超出範圍", message: "請重新輸入", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alert.addAction(okAction)
            presentViewController(alert, animated: true, completion: nil)
            return
        }else if inputCode > finalCode {
            topCode = inputCode!
            displayResultLabel()
        }else if inputCode < finalCode {
            bottomCode = inputCode!
            displayResultLabel()
        }
        
        if playerIndex < playerList.count - 1 {
            playerIndex += 1
        }else {
            playerIndex = 0
        }
        
        displayPlayerInfo()
        remainingNumberLable.text = "\(topCode - bottomCode - 1)"

    }
    
    func displayPlayerInfo() {
        let playerName = playerList[playerIndex]
        var nextPlayerName = ""
        
        playerNameLabel.text = playerName
        playerImageView.image = UIImage(named: playerName)
        if playerIndex == playerList.count - 1 {
            nextPlayerName = playerList[0]
        }else {
            nextPlayerName = playerList[playerIndex + 1]
        }
        nextPlayerNameLabel.text = nextPlayerName
        nextPlayerImageView.image = UIImage(named: nextPlayerName)
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
