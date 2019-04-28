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

Some security settings:

  1. `firewall.sh`
  2. [disable services](https://github.com/karek314/macOS-home-call-drop), use
     `lingon-x` app to disable some apple trash.

DNS:

  1. `dns.sh`
  2. `dnscrypt-proxy.toml` -> `/usr/local/etc/dnscrypt-proxy.toml`
  3. `dnsmasq.conf` -> `/usr/local/etc/dnsmasq.conf` (NOTE: don't use `dnsmasq`
     yet)
  4. `sudo brew services restart dnscrypt-proxy`
  5. `sudo brew services restart dnsmasq`
  6. `sudo networksetup -setdnsservers "Wi-Fi" 127.0.0.1`
  7. disable port 53 (DNS) in packet filter so some apps won't bypass the
     proxy. Add the rules to `/etc/pf.conf` (TODO: add anchor and
     enable/disable the rules with `dnscrypt_on/off` commands):
     ```
		 block drop quick on !lo0 proto udp from any to any port = 53
		 block drop quick on !lo0 proto tcp from any to any port = 53
     ```
     Restart the packet filter with `sudo pfctl -f /etc/pf.conf`

Reboot the system for some of the settings to take effect.

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

