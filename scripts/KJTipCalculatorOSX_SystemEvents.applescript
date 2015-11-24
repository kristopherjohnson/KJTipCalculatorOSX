#!/usr/bin/osascript

-- Example of using GUI Scripting with the KJTipCalculatorOSX application

tell application "System Events"
	activate the application "KJTipCalculatorOSX"
	
	set appProcess to the process "KJTipCalculatorOSX"
	
	set appWindow to the window "Tip Calculator" of appProcess
	
	set subtotalField to the first item of (text fields of appWindow whose description is "subtotal")
	set percentageField to the first item of (text fields of appWindow whose description is "tip percentage")
	set numberInPartyField to the first item of (text fields of appWindow whose description is "number in party")
	
	select the subtotalField
	set the value of the subtotalField to "453.21"
	confirm the subtotalField
	
	set the value of the percentageField to "21"
	confirm the percentageField
	
	set the value of the numberInPartyField to "4"
	confirm the numberInPartyField
	
	-- Get the per-person split
	get the value of the first item of (static texts of appWindow whose description is "per person")
end tell

