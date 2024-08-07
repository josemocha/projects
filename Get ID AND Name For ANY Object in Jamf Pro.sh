#!/bin/bash

########This is proof of concept############
########Don't hate##########################
client_id="ClientIDHere" 
client_secret="ClientSecretHere"
url="JamfProUrlHere"
##This output has multiple values, use plutil to extract the token
getAccessToken() {
	response=$(curl --silent --location --request POST "${url}/api/oauth/token" \
		--header "Content-Type: application/x-www-form-urlencoded" \
		--data-urlencode "client_id=${client_id}" \
		--data-urlencode "grant_type=client_credentials" \
		--data-urlencode "client_secret=${client_secret}")
	access_token=$(echo "$response" | plutil -extract access_token raw -)
	token_expires_in=$(echo "$response" | plutil -extract expires_in raw -)
	token_expiration_epoch=$(($current_epoch + $token_expires_in - 1))
}
getAccessToken

########Define the endpoint you want data from##############
endPoint="categories"

########Get all the ids for an endpoint##############
allEndPointIDs=$(curl -s -X GET "$url"/JSSResource/"$endPoint" -H "Accept: application/xml" -H "Authorization: Bearer $access_token" | xmllint --xpath '//id/text()' -)

########Loop through the endpoint by id##############
for thing in $allEndPointIDs;do
	echo "$comps"
	#curl -s -X GET "$url"/JSSResource/computers/id/$comps -H "Accept: application/xml" -H "Authorization: Bearer $access_token" | xmllint --format -
	curl -s -X GET "$url"/JSSResource/"$endPoint"/id/$thing -H "Accept: application/xml" -H "Authorization: Bearer $access_token" | xmllint --xpath '//name/text()' -
	
	sleep 1
done


