#!/bin/bash

#Version 1.3 Release notes.
#Tested in on macOS Monterey 12.2.1
#Added an volume unmount to "eject" the Jamf Connect Volume. 
#Without it the script remove the DMG and you have manually eject the Jamf Connect volume(s). Every time it ran it left a volume open.
#Left the hdiutil detach just in case. Could be commented out. 

##Resource
#https://www.jamf.com/products/jamf-connect/
#https://www.jamf.com/support/jamf-connect/
#https://www.jamf.com/resources/product-documentation/jamf-connect-administrators-guide/

#USE AT YOUR OWN RISK. Partial Code
curl 'https://files.jamfconnect.com/JamfConnect.dmg' -L -o /tmp/JamfConnect.dmg

echo "$!"
pid=$!
wait $pid

yes | PAGER=cat hdiutil attach -nobrowse -quiet /tmp/JamfConnect.dmg

echo "$!"
pid=$!
wait $pid

sudo /usr/sbin/installer -pkg /Volumes/JamfConnect/JamfConnect.pkg -target /

echo "$!"
pid=$!
wait $pid

sudo /usr/sbin/installer -pkg /Volumes/JamfConnect/Resources/JamfConnectLaunchAgent.pkg -target /

echo "$!"
pid=$!
wait $pid

hdiutil unmount -force /Volumes/JamfConnect/

echo "$!"
pid=$!
wait $pid

hdiutil detatch /tmp/JamfConnect.dmg

echo "$!"
pid=$!
wait $pid

rm /tmp/JamfConnect.dmg
