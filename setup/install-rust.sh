#!/usr/bin/env bash

# Installs Rustup
# @see https://www.rust-lang.org/tools/install
installRustup() {
  echo -e "\n============================="
  echo -e "Installing Rustup"
  echo -e "=============================\n"
  
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

installRustComponents() {
  echo -e "\n============================="
  echo -e "Installing Rust Components"
  echo -e "=============================\n"

  rustup component add rust-analyzer
}

## Might want to add clippy here too

installRustup
installRustComponents
