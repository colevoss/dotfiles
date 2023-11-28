#!/usr/bin/env bash

setupZsh() {
  echo -e "\n============================="
  echo -e "Configuring ZSH"
  echo -e "=============================\n"

  if [ ! -d "$HOME/.zsh" ]; then
    echo -e "\nCreating $HOME/.zsh directory...\n"
    mkdir -p -v $HOME/.zsh
  fi

  echo -e "\nLinking dotfiles zshrc..."
  ln -s -f -v $HOME/dotfiles/zsh/zshrc $HOME/.zshrc

  mkdir -p $HOME/.zsh/custom-completions
  fpath=($HOME/.zsh/zsh-completions/src $fpath)
  fpath=($HOME/.zsh/custom-completions $fpath)

  rm -f ~/.zcompdump; compinit
}

setupZsh
