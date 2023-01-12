#!/usr/bin/env bash

installTerminalStuff() {
  echo -e "Installing Terminal stuff"

  brew tap homebrew/cask-fonts

  brew install \
    awscli \
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
    pulumi/tap/pulumi \
    python \
    ripgrep \
    starship \
    tmux \
    tree

  brew install --cask \
    font-hack-nerd-font
}

installTerminalStuff
