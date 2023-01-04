#!/usr/bin/env bash

installLibraries() {
  brew bundle --file $HOME/dotfiles/brewfiles/terminal.Brewfile
}

configureTmux() {
  echo -e "\n============================="
  echo -e "Configuring Tmux"
  echo -e "=============================\n"

  if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo -e "Installing TPM"
    mkdir "$HOME/.tmux/plugins"

    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
  fi

  ln -s $HOME/dotfiles/tmux/tmux.conf $HOME/.tmux.conf

  echo -e "\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  echo -e "Remember to press \"prefix\" + I to install plugins"
  echo -e "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n"
}

setupZsh() {
  echo -e "\n============================="
  echo -e "Configuring ZSH"
  echo -e "=============================\n"

  # rm $HOME/.zshrc
  ln -s $HOME/dotfiles/zsh/zshrc $HOME/.zshrc
}

setupStarship() {
  echo -e "\n============================="
  echo -e "Setting up Starship"
  echo -e "=============================\n"

  # mkdir $HOME/.config # make config directory if necessary
  # rm $HOME/.config/starship.toml
  ln -s $HOME/dotfiles/starship/starship.toml $HOME/.config/starship.toml
}

installLibraries
setupZsh
setupStarship
configureTmux
