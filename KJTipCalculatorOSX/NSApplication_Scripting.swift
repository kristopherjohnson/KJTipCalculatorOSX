//
//  NSApplication_Scripting.swift
//  KJTipCalculatorOSX
//
//  Created by Kristopher Johnson on 11/22/15.
//  Copyright © 2015 Kristopher Johnson. All rights reserved.
//

import Cocoa

private var tc: TipCalculation?

/// Extend NSApplication to provide scriptable objects
extension NSApplication {

    /// Return `calculator` scripting object
    ///
    /// See KJTipCalculatorOSX.sdef for details of the scripting interface.
    dynamic var calculator: TipCalculation {
        if windows.count > 0 {
            if let vc = windows[0].windowController?.contentViewController as? ViewController {
                let tc = vc.tipCalculation
                if tc.objSpec == nil {
                    tc.objSpec = calculatorObjectSpecifier
                }
                return tc
            }
        }

        // If we couldn't get the one from the window, just return
        // another instance.
        if tc == nil {
            tc = TipCalculation()
            tc?.objSpec = calculatorObjectSpecifier
        }
        return tc!
    }

    var calculatorObjectSpecifier: NSNameSpecifier {
        let appClassDescription = NSScriptClassDescription(forClass: NSApplication.self)!
        
        return NSNameSpecifier(
            containerClassDescription: appClassDescription,
            containerSpecifier: nil,
            key: "calculator",
            name: "calculator")
    }
}
