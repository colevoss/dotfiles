#!/usr/bin/env bash

configureTmux() {
  echo -e "\n============================="
  echo -e "Configuring Tmux"
  echo -e "=============================\n"

  ln -s $HOME/dotfiles/tmux.conf $HOME/.tmux.conf
}

configureTmux