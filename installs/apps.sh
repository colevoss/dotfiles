#!/usr/bin/env bash

installApps() {
  echo -e "\n============================="
  echo -e "Installing Some Apps"
  echo -e "=============================\n"

  brew install --cask \
    fork \
    postman
}

installApps
