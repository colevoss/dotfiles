#!/usr/bin/env bash

# brew bundle dump --file="$DOTFILES/Brewfile" --force
main() {
  brew bundle dump --file="$HOME/Brewfile.tmp" --force --describe

  cp "$HOME/Brewfile.tmp" "$DOTFILES/Brewfile"
}

main