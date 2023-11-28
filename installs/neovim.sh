#!/usr/bin/env bash

installNeovim() {
  echo -e "\n============================="
  echo -e "Installing Neovim"
  echo -e "=============================\n"

  brew install neovim
}

installNeovoss() {
  echo -e "\n============================="
  echo -e "Installing Neovoss"
  echo -e "=============================\n"

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/colevoss/neovoss/main/tools/install.sh)"
}

installNeovim
installNeovoss
