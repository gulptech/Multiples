//
//  ViewController.swift
//  Multiples
//
//  Created by Joseph Pilon on 3/17/16.
//  Copyright © 2016 Gulp Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var playImg: UIImageView!
    @IBOutlet weak var postItImg: UIImageView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var multipleLbl: UILabel!
    @IBOutlet weak var instructionLbl: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    
    let maxMultiples: Int = 20
    var total = 0
    var loopNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberTextField.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playBtnTapped(sender: AnyObject) {
        dismissKeyboard()
        if let number = numberTextField.text where !number.isEmpty  {
            playBtn.hidden = true
            playImg.hidden = true
            postItImg.hidden = true
            numberTextField.hidden = true
            
            instructionLbl.text = "Press the Add button"
            
            addBtn.hidden = false
            redView.hidden = false
            multipleLbl.hidden = false
        } else {
            instructionLbl.text = "Press the Number and press the Add button"
        }
    }
    
    @IBAction func addBtnTapped(sender: AnyObject) {
        
        if let multiple = Int(numberTextField.text!)  {
        
            if loopNumber < maxMultiples {
                let oldTotal = total
                total = total + multiple
                multipleLbl.text = "\(oldTotal) + \(multiple) = \(total)"
                loopNumber += 1
            } else if loopNumber == maxMultiples {
                instructionLbl.text = "Press the Add to reset"
                loopNumber += 1
            } else {
                print("Resetting")
                total = 0
                loopNumber = 0
                playBtn.hidden = false
                playImg.hidden = false
                postItImg.hidden = false
                numberTextField.hidden = false
                numberTextField.text = ""
                addBtn.hidden = true
                redView.hidden = true
                multipleLbl.hidden = true
            }
        }
        
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = NSCharacterSet(charactersInString: "1234567890")
        let replacementTextIsNumeric = string.rangeOfCharacterFromSet(allowedCharacters)
        
        if replacementTextIsNumeric == nil {
            return false
        } else {
            return true
        }
    }

}

