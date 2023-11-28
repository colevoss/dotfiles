#!/usr/bin/env bash

installStarship() {
  echo -e "\n============================="
  echo -e "Installing Starship"
  echo -e "=============================\n"

  brew install starship
}

configureStarship() {
  echo -e "\n============================="
  echo -e "Configuring Starship"
  echo -e "=============================\n"

  if [ ! -d "$HOME/.config" ]; then
    echo -e "Creating $HOME/.config dir..."
    mkdir -p $HOME/.config # make config directory if necessary
  fi

  echo -e "Linking dotfiles starship file..."
  ln -s -f -v $HOME/dotfiles/starship/starship.toml $HOME/.config/starship.toml
}

installStarship
configureStarship
