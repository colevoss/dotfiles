#!/usr/bin/env bash

GHOSTTY_DIR="$HOME/.config/ghostty"

installGhostty() {
  echo "============================="
  echo "Installing Ghostty"
  echo "============================="

  brew install ghostty
}

linkConfig() {
  echo "============================="
  echo "Configuring Ghostty"
  echo "============================="

  echo "Creating ghostty directory $GHOSTTY_DIR"
  mkdir -p -v "$GHOSTTY_DIR"

  ln -s "$HOME/dotfiles/ghostty/config" "$GHOSTTY_DIR/config"
}

# installGhostty
linkConfig
