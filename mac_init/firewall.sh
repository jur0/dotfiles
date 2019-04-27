#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Turn on the firewall
/usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on

# Turn on the log mode
/usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on

# Turn on stealth mode (no replies to pings, etc)
/usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on

# Disable whitlisting software automatically
/usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off
/usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off

# Restart the firewall
pkill -HUP socketfilterfw

