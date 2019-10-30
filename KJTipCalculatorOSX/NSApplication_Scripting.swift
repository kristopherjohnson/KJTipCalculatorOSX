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
                return vc.tipCalculation
            }
        }

        // If we couldn't get the one from the window, just return
        // another instance.
        if tc == nil {
            tc = TipCalculation()
        }
        return tc!
    }
}

extension TipCalculation {
    override var objectSpecifier: NSScriptObjectSpecifier? {
        let appClassDescription = NSScriptClassDescription(for: NSApplication.self)!

        return NSNameSpecifier(
            containerClassDescription: appClassDescription,
            containerSpecifier: nil,
            key: "calculator",
            name: "calculator")
    }
}
