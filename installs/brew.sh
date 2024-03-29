#!/usr/bin/env bash

installHomebrew() {
  if ! command -v brew >/dev/null
  then
    echo -e "\n============================="
    echo -e "Installing Homebrew"
    echo -e "=============================\n"

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo '# Set PATH, MANPATH, etc., for Homebrew.' >> $HOME/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"

    exec zsh
  fi
}

tapCask() {
  echo -e "\n============================="
  echo -e "Tapping homebrew/cask"
  echo -e "=============================\n"

  brew tap homebrew/cask
}

installHomebrew
tapCask
