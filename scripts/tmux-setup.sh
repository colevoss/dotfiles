#!/usr/bin/env bash

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
  echo -e "Remember to press `prefix` + I to install plugins"
  echo -e "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n"
}

configureTmux
