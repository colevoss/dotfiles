#!/usr/bin/env bash

installFonts() {
  echo -e "\n============================="
  echo -e "Installing Fonts"
  echo -e "=============================\n"

  brew tap homebrew/cask-fonts

  brew install --cask font-hack-nerd-font
}

installFonts
