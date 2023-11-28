#!/usr/bin/env bash

installKitty() {
  echo -e "\n============================="
  echo -e "Installing Kitty"
  echo -e "=============================\n"

  brew install --cask kitty
}

configureKitty() {
  echo -e "\n============================="
  echo -e "Configuring Kitty"
  echo -e "=============================\n"

  ln -s $HOME/dotfiles/kitty $HOME/.config/kitty
}

installKitty
configureKitty
