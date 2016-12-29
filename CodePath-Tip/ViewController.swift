//
//  ViewController.swift
//  CodePath-Tip
//
//  Created by Kyle Leung on 12/27/16.
//  Copyright © 2016 Kyle Leung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalArea: UIView!
    @IBOutlet weak var defaultTipPercentage: UISegmentedControl!
    var defaultTip = 0
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        defaultTip = defaults.integer(forKey: "defaultTip")
        tipControl.selectedSegmentIndex = defaultTip
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let isGreaterthanZero = Double(billField.text!) ?? 0
        if isGreaterthanZero > 0 {
            totalArea.isHidden = false;
            tipLabel.isHidden = false;
        }
        else {
            totalArea.isHidden = true;
            tipLabel.isHidden = true;
        }
        
        let tipPercentages = [0.15,0.20,0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    


}

