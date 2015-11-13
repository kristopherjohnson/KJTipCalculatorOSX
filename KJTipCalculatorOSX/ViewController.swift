//
//  ViewController.swift
//  KJTipCalculatorOSX
//
//  Created by Kristopher Johnson on 11/11/15.
//  Copyright © 2015 Kristopher Johnson. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var subtotalTextField: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    @IBAction func subtotalClearButtonWasTapped(sender: AnyObject) {
        subtotalTextField.stringValue = ""
        subtotalTextField.becomeFirstResponder()
    }
}

