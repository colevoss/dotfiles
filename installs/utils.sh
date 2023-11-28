#!/usr/bin/env bash


installTerminalUtils() {
  echo -e "\n============================="
  echo -e "Installing Utils"
  echo -e "=============================\n"

  brew install \
    bat \
    bottom \
    exa \
    git \
    jq \
    ripgrep \
    tree

  echo -e "Terminal Utils Installed"
}

installTerminalUtils

