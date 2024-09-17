#!/bin/zsh

DaemonDir=/Library/LaunchDaemons
Daemonfile=com.opencore.alcverb.test.plist

cat > $Daemonfile << EOF
<?xml version="1.0"encoding="utf-8"?>
<!DOCTYPE plist PUBLIC"-//Apple//DTD PLIST 1.0//EN"
"http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>KeepAlive</key>
        <false/>
        <key>RunAtLoad</key>
        <true/>
        <key>Label</key>
        <string>com.opencore.alcverb</string>
        <key>ProgramArguments</key>
        <array>
            <string>bash</string>
            <string>-c</string>
            <string>sleep 10
/usr/local/bin/alc-verb 0x19 0x707 0x24</string>
        </array>
    </dict>
</plist>
EOF

sudo install -m 644 $Daemonfile $DaemonDir/$Daemonfile
sudo launchctl load $DaemonDir/$Daemonfile