#!/usr/bin/env bash

# Install rustup for rust.
curl https://sh.rustup.rs -sSf | sh

# Install libsodium - required by some projects (not always needed).
brew install libsodium

# Install packages needed to build erlang with asdf.
brew install wxmac

# Install asdf and plugins.
brew install asdf
# Check ERLANG_INSTALL.md
asdf plugin-add erlang
asdf plugin-add rebar
asdf plugin-add elixir
