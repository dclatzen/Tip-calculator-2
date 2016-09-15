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
    
    @IBOutlet weak var tipOptions: UISegmentedControl!
    
    @IBOutlet weak var tipControl: UISegmentedControl!

    @IBOutlet weak var barView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barView.alpha = 0
        self.barView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapArea(sender: AnyObject) {
        view.endEditing(true)
        moveUp()
        fade()
        expandWithDelay()
    }
    
    
    internal func fade() {
        UIView.animateWithDuration(1, animations: {
            self.barView.alpha = 1
        })
    }
    
    internal func moveUp() {
        UIView.animateWithDuration(0.5, animations: {
            self.barView.center.y -= 60
        })
    }
    
    internal func expand() {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.barView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        }) { (value:Bool) -> Void in
            print ("Job's done.")
        }
    
    }

    internal func expandWithDelay() {
        UIView.animateWithDuration(1, delay: 1, options: [.Repeat], animations: {
            self.barView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
            }) { (_) in
                print ("Completion")
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
