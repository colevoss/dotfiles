#!/usr/bin/env bash

installCasks() {
  echo -e "Installing Casks"

  brew tap homebrew/cask
  brew install mas

      # amethyst \
  brew install --cask \
      1password \
      alacritty \
      discord \
      docker \
      fork \
      google-chrome \
      kitty \
      moom \
      notion \
      obs \
      obsidian \
      postman \
      slack \
      soundsource \
      spotify \
      visual-studio-code \
      vlc

  # Install manico from app store
  mas install 724472954
}

installCasks
