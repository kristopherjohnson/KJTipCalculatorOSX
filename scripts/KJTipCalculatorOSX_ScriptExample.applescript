#!/usr/bin/osascript

-- Example of using the KJTipCalculatorOSX scripting interface

tell the application "KJTipCalculatorOSX"
	activate
	tell the calculator
		set the subtotal to 123.45
		set the percentage to 18
		set the number in party to 3
		
		get the properties
	end tell
end tell

