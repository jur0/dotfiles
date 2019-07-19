#!/usr/bin/env bash

# Install large binaries using brew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew cask upgrade

brew tap caskroom/fonts
brew cask install font-inconsolata
brew cask install font-inconsolata-for-powerline
brew cask install font-source-code-pro-for-powerline
brew cask install font-hack
brew cask install font-iosevka-nerd-font-mono

brew tap dteoh/sqa
brew cask install slowquitapps

brew cask install alfred
brew cask install appcleaner
brew cask install brave-browser
brew cask install dropbox
brew cask install dozer
brew cask install evernote
brew cask install flux
brew cask install firefox
# For istat-menus to be able monitor frequency of processor.
brew cask install intel-power-gadget
brew cask install istat-menus
brew cask install iterm2
brew cask install keybase
# Little snitch requires installer to be run after brew install.
brew cask install little-snitch
brew cask install lingon-x
brew cask install ledger-live
brew cask install macpass
brew cask install onionshare
brew cask install signal
brew cask install skype
brew cask install slack
brew cask install spectacle
brew cask install spotify
brew cask install the-unarchiver
brew cask install tor-browser
brew cask install transmission
brew cask install tunnelblick
brew cask install virtualbox
brew cask install vlc
brew cask install wireshark

brew cask cleanup

