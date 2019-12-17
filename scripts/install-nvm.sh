#!/usr/bin/env bash

installNvm() {
  echo -e "\n============================="
  echo -e "Installing NVM"
  echo -e "=============================\n"

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
}

installNvm