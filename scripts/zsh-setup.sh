#!/usr/bin/env bash

installZshPlugins() {
  echo -e "\n============================="
  echo -e "Installing ZSH Plugins"
  echo -e "=============================\n"

  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}

setupStarship() {
  echo -e "\n============================="
  echo -e "Setting up Starship"
  echo -e "=============================\n"

  mkdir $HOME/.config # make config directory if necessary
  rm $HOME/.config/starship.toml
  ln -s $HOME/dotfiles/starship.toml $HOME/.config/starship.toml
}

setupZsh() {
  echo -e "\n============================="
  echo -e "Configuring ZSH"
  echo -e "=============================\n"

  # rm $HOME/.zshrc
  ln -s ~/dotfiles/zsh/zshrc $HOME/.zshrc
}

installZshPlugins
setupStarship
setupZsh
