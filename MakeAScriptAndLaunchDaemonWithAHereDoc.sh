#!/bin/bash

daemonPath="/Library/LaunchDaemons/com.yourdomain.example.plist"
scriptPath="/Users/Shared/yourScriptNameHere.sh"

cat "$scriptPath" << "BRB"

#!/bin/bash
echo "Write things here that do stuff"
BRB

/bin/chmod 644 "$scriptPath"
/usr/sbin/chown root:wheel "$scriptPath"

if [[ -f "$daemonPath" ]]; then
	sudo launchctl bootout system "$daemonPath"
	rm -f "$daemonPath"
fi

cat > "$daemonPath" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
<key>Label</key>
<string>com.yourdomain.example</string>
<key>ProgramArguments</key>
<array>
<string>/bin/sh</string>
<string>/Users/Shared/yourScriptNameHere.sh</string>
</array>
<key>RunAtLoad</key>
<true/>
<key>StartInterval</key>
<integer>1800</integer>
</dict>
</plist>
EOF

/bin/chmod 644 "$daemonPath"
/usr/sbin/chown root:wheel "$daemonPath"
sudo /bin/launchctl bootstrap system "$daemonPath"