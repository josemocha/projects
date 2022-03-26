#!/bin/bash

#This script uses the production API to acquire the bearer token using basic auth. In this example it uses the classic API or the production API to get data.

jUNPW="username:password"
basicAuth=$(echo -n $jUNPW | base64)
jURL="https://yourjamfpro.jamfcloud.com"

#Get Bearer Token with Basic Auth
bToken=$(curl -sk -X POST "$jURL/api/v1/auth/token" -H "accept: application/json" -H "Authorization: Basic $basicAuth" | awk '/token/{print $3}' | tr -d '"'',')

#Use bearer token to get buildings in classic API. 
curl -sk -H "Authorization: Bearer $bToken" -H "accept: application/xml" "$jURL/JSSResource/buildings" -X GET | xmllint --format -

#Use bearer token to get buildings in Production API. 
curl -X GET "$jURL/api/v1/buildings" -H "accept: application/json" -H "Authorization: Bearer $bToken"
