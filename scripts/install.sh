#!/usr/bin/env bash

ROOT="$HOME/dotfiles/scripts"

promptYn() {
  while true; do
    read -p "$1 [yN] " yn

    case $yn in
      [Yy]* ) return 0;;
      [Nn]* ) return 1;;
      * ) echo "Please answer yes or no.";;
    esac
  done
}

stopToInstallZsh() {
#   echo -e '
# Sounds good. Before you proceed run
#   ./scripts/install-zsh.sh
# and then re-run this script.
# Make sure you restart your terminal session after installing oh-my-zsh
# '
  echo -e "Installing OH MY ZSH..."

  $ROOT/install-zsh.sh

  echo -e "Make sure you restart your terminal session"

  exit 0
}

main() {
  if promptYn "Install Homebrew and apps?"; then
    $ROOT/homebrew-setup.sh
  fi

  if promptYn "Configure ZSH?"; then
    $ROOT/zsh-setup.sh
  fi

  if promptYn "Configure Tmux?"; then
    # $ROOT/tmux-setup.sh
    $ROOT/oh-my-tmux-setup.sh
  fi

  if promptYn "Install NVM?"; then
    $ROOT/install-nvm.sh
  fi

  if promptYn "Configure VSCode"; then
    $ROOT/vscode-setup.sh
  fi

  echo "\n All done! You are good to go!"
}

# echo "Have you installed oh-my-zsh yet?";
# select omzInstallAnswer in "Yes" "No"; do
#   case $omzInstallAnswer in
#     Yes ) main; break;;
#     No ) stopToInstallZsh; exit 0;;
#   esac
# done

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "It looks like you have not install zsh, would you like to?"

  select omzInstallAnswer in "Yes" "No"; do
    case $omzInstallAnswer in
      Yes ) stopToInstallZsh; break;;
      No ) exit 0;;
    esac
  done
fi

main