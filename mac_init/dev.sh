#!/usr/bin/env bash

# Install rustup for rust.
curl https://sh.rustup.rs -sSf | sh

# Install libsodium - required by some projects (not always needed).
brew install libsodium
