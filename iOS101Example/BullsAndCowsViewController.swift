//
//  BullsAndCowsViewController.swift
//  iOS101Example
//
//  Created by PiHan Hsu on 8/9/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit

class BullsAndCowsViewController: UIViewController {

    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var resultLabels: [UILabel]!
    
    // TODO: 1. decide the data type you want to use to store the answear
    
    var index = 0
    
    override func viewDidLoad() {
        
        //TODO: 5. update layout with StackView
        //TODO: 6. Add auto lauout constrant
        super.viewDidLoad()
        setGame()
    }
    
    
    func setGame() {
        index = 0
        
        for resultLabel in resultLabels {
            resultLabel.text = ""
        }
        
        generateAnswer()
        
    }
    
    func generateAnswer() {
        // TODO: 2. generate your answear here
        // You need to generate 4 random and non-repeating digits.
        // Some hints: http://stackoverflow.com/q/24007129/938380
    }
    
    @IBAction func enterButtonPressed(sender: AnyObject) {
        
        let inputString = inputTextField.text
        
        // check if user enter 4 digits
        guard inputString?.characters.count == 4 else {
            let alert = UIAlertController(title: "you should input 4 digits to guess!", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        //show inputLabel
        resultLabels[index].text = inputTextField.text!
        index += 1
        
        //clear textField
        inputTextField.text = ""
        
        //TODO: 3. check the input number and show the hint on result Label
        
        /*
         resultLabels[index].text = ""
         */
        
        // TODO: 4. update the constant "correct" if the guess is correct
        
        //let correct = false
        
        //        if correct {
        //            let alert = UIAlertController(title: "Wow! You are awesome!", message: nil, preferredStyle: .Alert)
        //            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        //            self.presentViewController(alert, animated: true, completion: nil)
        //        }
        
    }
    
    @IBAction func startANewGame(sender: AnyObject) {
        setGame()
    }
    
    //Optional TODOs:
    //1. add a remianing Number
    //2. add a button and a label to show the answer
    //3. check there is no duplicate digit in inputNumber
    //4. check user can't guess the same number twice
    
    
    //Advance TODOs:
    //1. refactor this app with Model
    //2. refactor this app with Protocol
    //3. use table View to show the results
    //4. use your creation to add more fun feature
    

}
