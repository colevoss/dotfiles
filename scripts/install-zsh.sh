#!/usr/bin/env bash

installZsh() {
  echo -e "\n============================="
  echo -e "Installing Oh My ZSH"
  echo -e "=============================\n"

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

installZsh