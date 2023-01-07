#!/usr/bin/env bash

installGo() {
  echo -e "\n============================="
  echo -e "Installing Go"
  echo -e "=============================\n"

  brew bundle --file $HOME/dotfiles/brewfiles/go.Brewfile
}

installGoPls() {
  echo -e "\n============================="
  echo -e "Installing GoPls"
  echo -e "=============================\n"

  go install golang.org/x/tools/gopls@latest
}

installGo
installGoPls
