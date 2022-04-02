#!/bin/bash
#This script will output a text file with the status of your Content Caching service. 
macSerial=$(system_profiler SPHardwareDataType | awk '/Serial Number/{print $4}')
sudo /usr/bin/AssetCacheManagerUtil status | >> ~/Desktop/"AssetCache-$macSerial.txt"