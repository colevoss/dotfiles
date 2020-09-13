#!/usr/bin/env bash

configureTmux() {
  echo -e "\n============================="
  echo -e "Configuring Tmux"
  echo -e "=============================\n"

  git clone https://github.com/gpakosz/.tmux.git $HOME/.oh-my-tmux
  ln -s -f $HOME/.oh-my-tmux/.tmux.conf $HOME/.tmux.conf
  ln -s -f $HOME/dotfiles/oh-my-tmux.conf $HOME/.tmux.conf.local
}

configureTmux
