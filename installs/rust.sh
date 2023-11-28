#!/usr/bin/env bash

# Installs Rustup
# @see https://www.rust-lang.org/tools/install
installRustup() {
  echo -e "\n============================="
  echo -e "Installing Rustup"
  echo -e "=============================\n"
  
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

installRustComponents() {
  echo -e "\n============================="
  echo -e "Installing Rust Components"
  echo -e "=============================\n"

  rustup component add rust-analyzer
}

installRustCompletions() {
  if [ ! -d "$HOME/.zsh/custom-completions" ]; then
    echo -e "\n Creating custom-completions directory"
    mkdir -p -v $HOME/.zsh/custom-completions
  fi

  rustup completions zsh > $HOME/.zsh/custom-completions/_rustup
  rustup completions zsh cargo > $HOME/.zsh/custom-completions/_cargo

  rm -f ~/.zcompdump

  echo -e "\nReload your shell to compile new completions\n"
}

## Might want to add clippy here too

installRustup
installRustComponents
installRustCompletions
