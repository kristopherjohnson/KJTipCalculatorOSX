/*
Copyright (c) 2014, 2015 Kristopher Johnson

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
class TipCalculation: NSObject {
    // Properties bound to input fields
    dynamic var subtotal: Double   = 10 { didSet { updateDependentProperties() } }
    dynamic var tipPercentage: Int = 20 { didSet { updateDependentProperties() } }
    dynamic var numberInParty: Int = 1  { didSet { updateDependentProperties() } }

    // Properties bound to output fields
    dynamic var tip: Double       = 0
    dynamic var total: Double     = 0
    dynamic var perPerson: Double = 0

    override init() {
        super.init()
        updateDependentProperties()
    }

    private func updateDependentProperties() {
        tip = (Double(tipPercentage) * 0.01) * subtotal
        total = subtotal + tip
        perPerson = numberInParty < 1 ? total : (total / Double(numberInParty))
    }
}
