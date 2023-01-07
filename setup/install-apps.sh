#!/usr/bin/env bash

installUtils() {
  echo -e "\n============================="
  echo -e "Installing Utils"
  echo -e "=============================\n"

  brew bundle --file $HOME/dotfiles/brewfiles/apps.Brewfile
}

installUtils
