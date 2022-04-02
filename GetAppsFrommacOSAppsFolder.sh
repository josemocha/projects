#!/bin/bash

#Get a list of apps from Applications folder
macSerial=$(system_profiler SPHardwareDataType | awk '/Serial Number/{print $4}')
for APPS in "$( ls /Applications )" ; do
	echo "result is: " "$APPS" > ~/Desktop/allApps-$macSerial.txt
	echo "$APPS"
done


exit 0