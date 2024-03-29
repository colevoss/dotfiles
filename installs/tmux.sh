#!/usr/bin/env bash

installTmux() {
  echo -e "\n============================="
  echo -e "Installing Tmux"
  echo -e "=============================\n"

  brew install tmux
}

configureTmux() {
  echo -e "\n============================="
  echo -e "Configuring Tmux"
  echo -e "=============================\n"

  if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo -e "Installing TPM..."
    mkdir "$HOME/.tmux/plugins"

    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
  fi

  echo -e "Linking dotfiles tmux.conf..."
  ln -s -f -v $HOME/dotfiles/tmux/tmux.conf $HOME/.tmux.conf

  echo -e "\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  echo -e "Remember to press \"prefix\" + I to install plugins"
  echo -e "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n"
}

fixTmuxItalics() {
  # Reference: https://gist.github.com/bbqtd/a4ac060d6f6b9ea6fe3aabe735aa9d95

  set -e

  echo -e "Checking for tmux-256color info..."
  infocmp -x tmux-256color > /dev/null 2>&1

  if [ $? -eq 0 ]; then
    echo "tmux-256color should work already"
    exit 0
  fi

  echo "Checking for tic..."
  if ! which tic | grep -q "^/usr/bin/tic$"; then
    echo 'you must fix the $PATH for a shell, or uninstall a local ncurses by using a package manager.'
    exit 0
  fi
  echo "Yep. We have the right tic"

  echo -e "Downloading terminfo.src.gz..."
  curl -LO https://invisible-island.net/datafiles/current/terminfo.src.gz && gunzip terminfo.src.gz

  echo -e "Compiling terminfo for tmux-256color..."
  /usr/bin/tic -xe tmux-256color terminfo.src

  if infocmp -x tmux-256color | grep sitm; then
    echo -e "tmux-256color terminfo successfully installed"
    echo -e 'run `infocmp -x tmux-256color | grep sitm` to confirm for yourself'
    echo -e "Tmux should work with italics and just work in general now"
  fi
}

installTmux
configureTmux
fixTmuxItalics
