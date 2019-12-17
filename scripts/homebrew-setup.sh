#!/usr/bin/env bash

installHomebrew() {
  echo -e "\n============================="
  echo -e "Installing Homebrew"
  echo -e "=============================\n"

  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

installPackages() {
  echo -e "\n============================="
  echo -e "Installing Packages"
  echo -e "=============================\n"

  brew bundle --file=$HOME/dotfiles/Brewfile
}

installHomebrew
installPackages