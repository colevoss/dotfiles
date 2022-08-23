#!/usr/bin/env bash

setupZsh() {
  echo -e "\n============================="
  echo -e "Configuring ZSH"
  echo -e "=============================\n"

  # rm $HOME/.zshrc
  ln -s ~/dotfiles/zsh/zshrc $HOME/.zshrc
}

setupStarship() {
  echo -e "\n============================="
  echo -e "Setting up Starship"
  echo -e "=============================\n"

  # mkdir $HOME/.config # make config directory if necessary
  # rm $HOME/.config/starship.toml
  ln -s $HOME/dotfiles/starship/starship.toml $HOME/.config/starship.toml
}

setupZsh
setupStarship
