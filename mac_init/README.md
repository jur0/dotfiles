Installation & maintenance instructions for OS X
================================================

Install Command Line Tools for XCode:
```
xcode-select --install
```

All the packages are installed and maintained using `brew` and `brew cask`
(large binaries). Therefore, we need to install `brew` itself:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

All the installation scripts for OS X are in `mac_init` directory.

Package installation is performed by running the scripts:

  1. `brew.sh`
  2. `brew_cask.sh`
  3. `dev.sh`

In order to setup the OS X and some of the installed packages, run the
scripts:

  1. `setup.sh`
  2. `dock.sh`

Reboot the system for some of the settings to take effect

System upgrade
--------------

There is a command `osxupdate` that is used for system upgrade. It basically
uses other commands to upgrade the system and installed packages:

  * `softwareupdate -l` - lists possible system updates
  * `sudo mas upgrade` - upgrades packages installed by App Store
  * `brew update` - updates the list of packages
  * `brew upgrade` - upgrades installed packages
  * `brew cask upgrade` - upgrades installed packages (using `brew cask`)

In case there are any system updates, you can use `softwareupdate -irv` to
execute recommended upgrades or `sudo softwareupdate -iav` for all system
upgrades.

