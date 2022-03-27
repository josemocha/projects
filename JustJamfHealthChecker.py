#!/usr/bin/env python3
##Resource: https://docs.python-requests.org/en/latest/
##https://pypi.org/project/requests/
##https://www.w3schools.com/python/python_conditions.asp

##You may need to instll requests
##If you are using python 3 and have python 2.X installed make sure you reference python3
##Use the command below to install requests
##python3 -m pip install requests

import requests
jURL = "https://josemocha.jamfcloud.com/healthCheck.html"
headers = {"Accept": "application/xml"}
healthStatus = requests.request("GET", jURL, headers=headers)
print (healthStatus.text)
