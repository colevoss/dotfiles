#!/usr/bin/env bash

installApps() {
  echo -e "\n============================="
  echo -e "Installing Docker"
  echo -e "=============================\n"

  brew install --cask docker
}

installApps
