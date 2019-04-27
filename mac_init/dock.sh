#!/usr/bin/env bash

# Items in mac's dock.

dockutil --remove all

dockutil --add '~/Downloads' --view grid --display folder

dockutil --add /Applications/iTerm.app
dockutil --add /Applications/Firefox.app
dockutil --add /Applications/Brave\ Browser.app
dockutil --add /Applications/Tor\ Browser.app
dockutil --add /Applications/Evernote.app
dockutil --add /Applications/MacPass.app
dockutil --add /Applications/Calendar.app
dockutil --add /Applications/Signal.app
dockutil --add /Applications/VLC.app
dockutil --add /Applications/Slack.app
dockutil --add /Applications/VirtualBox.app
dockutil --add /Applications/Spotify.app
dockutil --add /Applications/System\ Preferences.app

