#!/usr/bin/env bash

installTerminalStuff() {
  echo -e "Installing Terminal stuff"

  brew tap homebrew/cask-fonts


  brew install \
    awscli \
    bat \
    bottom \
    chruby \
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
    ruby-install \
    starship \
    stats \
    tmux \
    tree

  brew install --cask \
    font-hack-nerd-font \
    dotnet-sdk
}

installTerminalStuff
