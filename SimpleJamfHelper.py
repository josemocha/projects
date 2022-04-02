#!/usr/bin/env python3

import os
jamfHelper = "/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -title 'An important Message' -heading 'Urgent Message' -description 'Please choose Yes or No' -icon '/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AlertNoteIcon.icns' -button1 'Yes' -button2 'No' -defaultButton '1'"

jamfMSG = os.system(jamfHelper)
