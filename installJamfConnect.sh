#!/bin/bash
#USE AT YOUR OWN RISK.

#Version 1.3 Release notes.
#Tested in on macOS Monterey 12.2.1
#Added an volume unmount to "eject" the Jamf Connect Volume. 
#Without it the script remove the DMG and you have manually eject the Jamf Connect volume(s). Every time it ran it left a volume open.
#Left the hdiutil detach just in case. Could be commented out. 
#If you are running this with Jamf Pro you should update inventory after installing the latest version of Jamf Connect.

##Resource
#https://www.jamf.com/products/jamf-connect/
#https://www.jamf.com/support/jamf-connect/
#https://www.jamf.com/resources/product-documentation/jamf-connect-administrators-guide/

#pulls down the latest build of Jamf Connect.
curl 'https://files.jamfconnect.com/JamfConnect.dmg' -L -o /tmp/JamfConnect.dmg

echo "$!"
pid=$!
wait $pid

#Agrees to the DMG terms and conditions. 
#It is stronngly recommended you read, understand and agree to the terms and conditions outlined the DMG.
yes | PAGER=cat hdiutil attach -nobrowse -quiet /tmp/JamfConnect.dmg

echo "$!"
pid=$!
wait $pid

#Installs the Jamf Connect .pkg on your Mac Computer.
sudo /usr/sbin/installer -pkg /Volumes/JamfConnect/JamfConnect.pkg -target /

echo "$!"
pid=$!
wait $pid

#Intalls the Jamf Conect LaunchAgent .pkg on your Mac computer.
sudo /usr/sbin/installer -pkg /Volumes/JamfConnect/Resources/JamfConnectLaunchAgent.pkg -target /

echo "$!"
pid=$!
wait $pid

#Unmounts the DMG volume. 
hdiutil unmount -force /Volumes/JamfConnect/

echo "$!"
pid=$!
wait $pid

#Detaches the DMG volume. 
hdiutil detatch /tmp/JamfConnect.dmg

echo "$!"
pid=$!
wait $pid

#Remove the Jamf Connect DMG.
rm /tmp/JamfConnect.dmg
