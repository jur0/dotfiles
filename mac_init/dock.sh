#!/usr/bin/env bash

# Items in mac's dock.

dockutil --remove all --allhomes

dockutil --add '~/Downloads' --view grid --display folder --allhomes

dockutil --add /Applications/iTerm.app --allhomes
dockutil --add /Applications/Google\ Chrome.app --allhomes
dockutil --add /Applications/Brave.app --allhomes
dockutil --add /Applications/TorBrowser.app --allhomes
dockutil --add /Applications/Evernote.app --allhomes
dockutil --add /Applications/MacDown.app --allhomes
dockutil --add /Applications/MacPass.app --allhomes
dockutil --add /Applications/Calendar.app --allhome
dockutil --add /Applications/Signal.app --allhomes
dockutil --add /Applications/VLC.app --allhomes
dockutil --add /Applications/Slack.app --allhomes
dockutil --add /Applications/VirtualBox.app --allhomes
dockutil --add /Applications/Spotify.app --allhomes
dockutil --add /Applications/System\ Preferences.app --allhomes
