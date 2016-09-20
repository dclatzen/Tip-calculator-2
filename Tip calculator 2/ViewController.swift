//
//  ViewController.swift
//  Tip calculator 2
//
//  Created by computer on 9/12/16.
//  Copyright © 2016 Myself. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!

    @IBOutlet weak var barView: UIView!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet var horizontalDiv: UIView!

    @IBOutlet weak var theWordTip: UILabel!
    
    @IBOutlet weak var theWordsTotalBill: UILabel!
    
    @IBOutlet weak var splitTab: UIButton!
    
    
// Set up initial state of all views
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billField.becomeFirstResponder()
        
        // Entry group
        billField.frame = CGRect(x: 26, y: 190, width: 173, height: 30)
        barView.frame = CGRect(x: 20, y: 240, width: 280, height: 1)
        barView.alpha = 0
        splitTab.alpha = 0
        
        // Results group
        totalLabel.textColor = UIColor(red: 50/255, green: 188/255, blue: 50/255, alpha: 1)
        tipLabel.alpha = 0
        theWordTip.alpha = 0
        totalLabel.alpha = 0
        theWordsTotalBill.alpha = 0
        
        // Execution group
        calculateButton.backgroundColor = UIColor(red: 50/255, green: 188/255, blue: 50/255, alpha: 1)
        tipControl.alpha = 0
    }
    
    
// Create any animation functions that need their own parameters
    
    internal func splitFadeIn() {
        UIView.animateWithDuration(0.3, delay: 0.1, options: [], animations: {
            self.splitTab.alpha = 1
        }) { (_) in
            print ("splitFadeIn executed")
        }
    }
    
    
// Set up actions

    @IBAction func tapArea(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBAction func buttonFade(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: {
            
            // Entry group
            self.billField.frame = CGRect(x: 26, y: 77, width: 173, height: 30)
            self.barView.frame = CGRect(x: 20, y: 114, width: 280, height: 1)
            self.barView.alpha = 1
            self.splitFadeIn()
//            self.adjustBillFont()
            
            
            // Results group
            self.tipLabel.alpha = 1
            self.theWordTip.alpha = 1
            self.totalLabel.alpha = 1
            self.theWordsTotalBill.alpha = 1
            
            // Execution Group
            self.calculateButton.alpha = 0
            self.tipControl.alpha = 1
        }) { (_) in
            print ("buttonFade executed")
        }
    }
    
    
    
    @IBAction func calculateTip(sender: AnyObject) {
        
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
}







// ** Elephant Graveyard **

// internal func fade() {
//     UIView.animateWithDuration(1, animations: {
//         self.barView.alpha = 1
//     })
// }



// internal func moveUp() {
//     UIView.animateWithDuration(0.5, animations: {
//         self.barView.center.y -= 60
//     }) { (_) -> Void in
//         print ("moveUp executed")
//     }
// }



//    internal func changeColor() {
//        UIView.animateWithDuration(2, delay: 0.6, options: [], animations: {
//            self.barView.backgroundColor = UIColor.redColor()
//        }) { (_) in
//            print ("changeColor executed")
//        }
//    }


//    internal func adjustBillFont() {
//        // Trying to figure out how to resize a textField font
//        billField.font? = billField.font?.fontWithSize(50)
//        print ("adjustBillFont loaded")
//    }


//  internal func expand() {
//      UIView.animateWithDuration(0.5, animations: { () -> Void in
//          self.barView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
//      }) { (value:Bool) -> Void in
//          print ("expand executed")
//      }
//  }


//   internal func expandWithDelay() {
//       UIView.animateWithDuration(0.5, delay: 0.2, options: [], animations: {
//       self.barView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
//           }) { (_) in
//               print ("expandWithDelay executed")
//       }
//   }