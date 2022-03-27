#!/bin/bash

#"/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper" -help

jHelper="/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper"
titleWords="Urgent"
heading="An important message from the Rooted Consulting team."
descriptionWords="We haven't heard from you in a while. Please update your inventory by selecting 'Yes'"
iConPath="/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/Actions.icns"


#jamfHelped=$("$jHelper" -windowType utility -title "$titleWords" -heading "$heading" -description "$descriptionWords" -icon "$iConPath" -button1 "Yes" -button2 "No" -defaultButton "1" -cancelButton "2" -showDelayOptions "900, 1800, 2700, 604800")

jamfHelped=$("$jHelper" -windowType utility -title "$titleWords" -heading "$heading" -description "$descriptionWords" -icon "$iConPath" -button1 "Yes" -button2 "No" -defaultButton "1" -cancelButton "2")

if [[ "$jamfHelped" == "0" ]]; then
	sudo jamf recon
fi
