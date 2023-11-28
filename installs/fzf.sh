#!/usr/bin/env bash

installFzf() {
  echo -e "\n============================="
  echo -e "Installing FZF"
  echo -e "=============================\n"

  brew install fzf
}

configureFzf() {
  echo -e "\n============================="
  echo -e "Configuring FZF"
  echo -e "=============================\n"
  $(brew --prefix)/opt/fzf/install
}

installFzf
configureFzf
