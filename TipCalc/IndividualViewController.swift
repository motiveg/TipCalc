//
//  IndividualViewController.swift
//  TipCalc
//
//  Created by Brian Casipit on 9/1/18.
//  Copyright © 2018 Brian Casipit. All rights reserved.
//

// Code commented with "Credit: Paul Solt" comes from the following youtube tutorials:
// https://www.youtube.com/watch?v=xVZubAMFuIU
// https://www.youtube.com/watch?v=iUQ1GfiVzS0
// These videos give a solution for text fields covered by the keyboard

import UIKit

// The UIViewController is responsible for the Individual screen.
// This screen is used to calculate and display payments for multiple individuals.

// TODO/TOFIX:
// - use separate classes and functions to clean up and encapsulate code
// - be able to add and remove number of individuals --> add and remove fields
// - use data structures to remove clutter
// - replace hardcode wherever possible
// - keep screen position in place when editing taxField and/or individualField
class IndividualViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var taxControl: UISegmentedControl!
    @IBOutlet weak var taxField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    // individuals: temporary hardcode testing
    @IBOutlet weak var oneBaseField: UITextField!
    @IBOutlet weak var twoBaseField: UITextField!
    @IBOutlet weak var threeBaseField: UITextField!
    @IBOutlet weak var fourBaseField: UITextField!
    @IBOutlet weak var fiveBaseField: UITextField!
    @IBOutlet weak var sixBaseField: UITextField!
    @IBOutlet weak var oneSubtotalLabel: UILabel!
    @IBOutlet weak var twoSubtotalLabel: UILabel!
    @IBOutlet weak var threeSubtotalLabel: UILabel!
    @IBOutlet weak var fourSubtotalLabel: UILabel!
    @IBOutlet weak var fiveSubtotalLabel: UILabel!
    @IBOutlet weak var sixSubtotalLabel: UILabel!
    
    
    //var activeTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Credit: Paul Solt
        // Listen for keyboard events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    // Credit: Paul Solt
    deinit {
        // Stop listening for keyboard hide/show events
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //func textFieldDidBeginEditing(_ textField: UITextField) {
    //    self.activeTextField = textField
    //}
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    // Credit: Paul Solt
    @objc func keyboardWillChange(notification: Notification) {
        print("Keyboard will show: \(notification.name.rawValue)\n")
        
        guard let keyboardRect = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        //if (self.activeTextField != taxField && self.activeTextField != individualsField) {
            if notification.name == Notification.Name.UIKeyboardWillShow || notification.name == Notification.Name.UIKeyboardWillChangeFrame {
                view.frame.origin.y = -keyboardRect.height
            } else {
                view.frame.origin.y = 0
            }
        //}
        
    }
    
    // BELOW: temporary hardcode for testing

    // FUNCTION PURPOSE/GOALS:
    // 1) calculate each individual's subtotal using:
    //     tax, tip percentage, and individual's base cost
    // 2) update the total using:
    //     every individual's base cost
    // FUTURE IMPROVEMENTS:
    // 1) split calculations into separate functions wherever best
    // 2) dynamically adjust the number of fields based on no. of indiv.
    @IBAction func updateTotals(_ sender: Any) {
        
        let taxTypes = ["dollarTax", "percentTax"]
        let selectedTaxType = taxTypes[taxControl.selectedSegmentIndex]
        
        let tipPercentages = [0.10, 0.12, 0.15, 0.18, 0.20, 0.25]
        let tipPercent = Double(tipPercentages[tipControl.selectedSegmentIndex])
        
        if (selectedTaxType == "dollarTax") {
            
            // set constants for base prices
            let oneBase = Double(oneBaseField.text!) ?? 0
            let twoBase = Double(twoBaseField.text!) ?? 0
            let threeBase = Double(threeBaseField.text!) ?? 0
            let fourBase = Double(fourBaseField.text!) ?? 0
            let fiveBase = Double(fiveBaseField.text!) ?? 0
            let sixBase = Double(sixBaseField.text!) ?? 0
            
            // set and calculate needed variables
            let sumOfBases = oneBase + twoBase + threeBase + fourBase + fiveBase + sixBase
            let dollarTax = Double(taxField.text!) ?? 0
            let totalBeforeTip = sumOfBases + dollarTax
            let percentTax = ( totalBeforeTip / sumOfBases ) - 1.00
            
            // calculate individual subtotals
            let oneSubtotal = ( oneBase * ( 1.00 + percentTax)) * ( 1.00 + tipPercent )
            let twoSubtotal = ( twoBase * ( 1.00 + percentTax)) * ( 1.00 + tipPercent )
            let threeSubtotal = ( threeBase * ( 1.00 + percentTax)) * ( 1.00 + tipPercent )
            let fourSubtotal = ( fourBase * ( 1.00 + percentTax)) * ( 1.00 + tipPercent )
            let fiveSubtotal = ( fiveBase * ( 1.00 + percentTax)) * ( 1.00 + tipPercent )
            let sixSubtotal = ( sixBase * ( 1.00 + percentTax)) * ( 1.00 + tipPercent )
            
            // calculate total
            let total = oneSubtotal + twoSubtotal + threeSubtotal + fourSubtotal + fiveSubtotal + sixSubtotal
            
            // set labels
            oneSubtotalLabel.text = String( format: "$%.2f", oneSubtotal )
            twoSubtotalLabel.text = String( format: "$%.2f", twoSubtotal )
            threeSubtotalLabel.text = String( format: "$%.2f", threeSubtotal )
            fourSubtotalLabel.text = String( format: "$%.2f", fourSubtotal )
            fiveSubtotalLabel.text = String( format: "$%.2f", fiveSubtotal )
            sixSubtotalLabel.text = String( format: "$%.2f", sixSubtotal )
            totalLabel.text = String(format: "$%.2f", total)
        }
        
        if (selectedTaxType == "percentTax") {
            
            let percentTax = ( Double(taxField.text!) ?? 0 ) / 100.0
            
            // individual #1 subtotal
            let oneBase = Double(oneBaseField.text!) ?? 0
            let oneSubtotal = (oneBase * (1.00 + percentTax)) * (1.00 + tipPercent)
            oneSubtotalLabel.text = String( format: "$%.2f", oneSubtotal )
            
            // individual #2 subtotal
            let twoBase = Double(twoBaseField.text!) ?? 0
            let twoSubtotal = (twoBase * (1.00 + percentTax)) * (1.00 + tipPercent)
            twoSubtotalLabel.text = String( format: "$%.2f", twoSubtotal )
            
            // individual #3 subtotal
            let threeBase = Double(threeBaseField.text!) ?? 0
            let threeSubtotal = (threeBase * (1.00 + percentTax)) * (1.00 + tipPercent)
            threeSubtotalLabel.text = String( format: "$%.2f", threeSubtotal )
            
            // individual #4 subtotal
            let fourBase = Double(fourBaseField.text!) ?? 0
            let fourSubtotal = (fourBase * (1.00 + percentTax)) * (1.00 + tipPercent)
            fourSubtotalLabel.text = String( format: "$%.2f", fourSubtotal )
            
            // individual #5 subtotal
            let fiveBase = Double(fiveBaseField.text!) ?? 0
            let fiveSubtotal = (fiveBase * (1.00 + percentTax)) * (1.00 + tipPercent)
            fiveSubtotalLabel.text = String( format: "$%.2f", fiveSubtotal )
            
            // individual #6 subtotal
            let sixBase = Double(sixBaseField.text!) ?? 0
            let sixSubtotal = (sixBase * (1.00 + percentTax)) * (1.00 + tipPercent)
            sixSubtotalLabel.text = String( format: "$%.2f", sixSubtotal )
            
            // total
            let total = oneSubtotal + twoSubtotal + threeSubtotal + fourSubtotal + fiveSubtotal + sixSubtotal
            totalLabel.text = String(format: "$%.2f", total)
        }
        
    }

}
