#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update
# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils

brew install findutils

# Install utils.
brew install gnu-indent
brew install gnu-sed
brew install gnu-tar
brew install gnu-which
brew install grep
brew install make

brew install ack
brew install diffutils
# Maybe further fzf installation will be needed using an install script.
brew install fzf
brew install gawk
brew install gnupg
brew install gnupg2
brew install gnutls
brew install git
brew install git-flow
brew install gzip
brew install less
brew install mc
brew install nmap
brew install openssh
brew install rsync
brew install screen
brew install tmux
brew install p7zip
brew install pigz
brew install pv
brew install pyenv
brew install zlib   # in order to build python with pyenv
brew install rename
brew install ssh-copy-id
brew install testssl
brew install tree
brew install vbindiff
brew install watch
brew install wdiff
brew install wget
brew install zopfli

# Install Bash 4.
brew install bash
brew install bash-completion2

# Install zsh.
brew install zsh

if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
fi;

# Switch to using brew-installed zsh as default shell.
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
  echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/zsh;
  # Install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  # Install antigen - package manager for zsh.
  brew install antigen
fi;

# Install neovim.
brew install neovim

# Install python
# https://github.com/pyenv/pyenv/wiki/Common-build-problems
CPPFLAGS="-I$(brew --prefix zlib)/include" pyenv install -v 2.7.15
CPPFLAGS="-I$(brew --prefix zlib)/include" pyenv install -v 3.7.1
# Set both global python versions (python3 preferred as it's 1st).
pyenv global 3.7.1 2.7.15

# Install python neovim modules
pip2 install neovim
pip3 install neovim

# Install npm.
brew install npm

# Install tmuxp (tmux session manager).
pip3 install tmuxp
mkdir ${HOME}/.tmuxp

# EMACS!
brew tap d12frosted/emacs-plus
brew install emacs-plus
ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications

# Install direnv.
brew install direnv

brew install vimpager
brew install source-highlight
brew install grc

# Install dockutil.
brew install dockutil

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# CLI for Mac App Store.
brew install mas

# CLI for speedtest.net.
brew install speedtest-cli

# Install parity ethereum client.
brew tap paritytech/paritytech
brew install parity

# Remove outdated versions from the cellar.
brew cleanup

