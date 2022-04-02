#!/bin/bash

#This script will prompt a user to choose where or not to install zoom. Based on the choice made it will either install zoom or exit out with a message to install zoom soon. 
userPrompt=$(osascript -e 'display dialog "Do you want to install Zoom" buttons {"YES", "NO"} default button 1'| tr -d "button returned:")

if [[ "$userPrompt" == "YES" ]]; then
	curl 'https://zoom.us/client/latest/ZoomInstallerIT.pkg' -L -o /tmp/ZoomInstallerIT.pkg
	
	echo "$!"
	pid=$!
	wait $pid
	
	/usr/sbin/installer -pkg /tmp/ZoomInstallerIT.pkg -target /
	
	echo "$!"
	pid=$!
	wait $pid
	
	open "/Applications/zoom.us.app"
	
	echo "$!"
	pid=$!
	wait $pid
	
	rm /tmp/ZoomInstallerIT.pkg
else
	ExitMessage=$(osascript -e 'display dialog "You should install Zoom soon." buttons {"OK"} default button 1')
	echo "$ExitMessage"
	exit
fi