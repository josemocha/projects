

#!/bin/bash

enrollType=`profiles status -type enrollment`
Echo "<result>$enrollType</result>"
#This (might not) won't work in 10.13.1 and earlier.