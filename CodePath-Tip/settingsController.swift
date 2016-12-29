//
//  settingsController.swift
//  CodePath-Tip
//
//  Created by Kyle Leung on 12/29/16.
//  Copyright © 2016 Kyle Leung. All rights reserved.
//

import UIKit

class settingsController: UIViewController {
    



    @IBOutlet weak var defaultTipPercentage: UISegmentedControl!
    var defaultTipSetting = 0
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultTipSetting = defaults.integer(forKey: "defaultTip")
        defaultTipPercentage.selectedSegmentIndex = defaultTipSetting
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
        @IBAction func DefaultTipChange(_ sender: AnyObject) {
        defaultTipSetting = defaultTipPercentage.selectedSegmentIndex
        defaults.set(defaultTipSetting, forKey: "defaultTip")
    }
    
    
    
}
