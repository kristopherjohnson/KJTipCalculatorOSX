/*
Copyright 2015 Kristopher Johnson

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation

// Given subtotal, tip percentage, and number in party, calculates tip, total, and per-person split
@objc(KJTipCalculation)
class TipCalculation: NSObject {
    // Properties bound to input fields
    dynamic var subtotal: NSNumber? = 10 { didSet { updateDependentProperties() } }
    dynamic var tipPercentage: NSNumber? = 20 { didSet { updateDependentProperties() } }
    dynamic var numberInParty: NSNumber? = 1  { didSet { updateDependentProperties() } }

    // Properties bound to output fields
    dynamic var tip: NSNumber?
    dynamic var total: NSNumber?
    dynamic var perPerson: NSNumber?

    override init() {
        super.init()
        updateDependentProperties()
    }

    private func updateDependentProperties() {
        switch (subtotal, tipPercentage, numberInParty) {
        case let (.Some(subtotal), .Some(tipPercentage), .Some(numberInParty)):
            tip = (tipPercentage.doubleValue * 0.01) * subtotal.doubleValue
            total = subtotal.doubleValue + tip!.doubleValue
            perPerson = numberInParty.integerValue < 1 ? total : (total!.doubleValue / numberInParty.doubleValue)
        default:
            tip = nil
            total = nil
            perPerson = nil
        }

    }

    // MARK: Scriptability support

    /// Property set by application when it returns a TipCalculation instance
    /// as a scriptable object.
    var objSpec: NSScriptObjectSpecifier?

    override var objectSpecifier: NSScriptObjectSpecifier? {
        return objSpec
    }
}
