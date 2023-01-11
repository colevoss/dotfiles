#!/usr/bin/env bash

installTerminalStuff() {
  echo -e "Installing Terminal stuff"

  brew tap homebrew/cask-fonts

  brew install \
      bat \
      bottom \
      exa \
      fd \
      fzf \
      git \
      git-delta \
      jq \
      lazygit \
      lf \
      neovim \
      ripgrep \
      starship \
      tmux \
      tree \
      wez/wezterm/wezterm

  brew install --cask \
    font-hack-nerd-font
}

installTerminalStuff
