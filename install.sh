#!/usr/bin/env bash

DOTFILES_DIR=$HOME/dotfiles

set -e

abort() {
  printf "%s\n" "$@" >&2
  exit 1
}

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

if [[ ! -n $(xcode-select -p 1>/dev/null;  echo $?) ]]; then
  # echo "Dev Tools is not installed"

  abort """
  Dev tools is not installed.
  Run `xcode-select --install`
  or download from Apple's website:
  Download XCode from Apple's Website: https://developer.apple.com/xcode/
  """
fi

echo "Cloning dotfiles repo"
echo ""

if promptYn "Clone Repo?"; then
  rm -rf $DOTFILES_DIR
  git clone --progress git@github.com:colevoss/dotfiles.git $DOTFILES_DIR
fi

$DOTFILES_DIR/installs/brew.sh

if promptYn "Install Utils?"; then
  $DOTFILES_DIR/installs/utils.sh
fi

if promptYn "Install Fonts?"; then
  $DOTFILES_DIR/installs/fonts.sh
fi

if promptYn "Install FZF?"; then
  $DOTFILES_DIR/installs/fzf.sh
fi

if promptYn "Install Git Delta?"; then
  $DOTFILES_DIR/installs/git-delta.sh
fi

if promptYn "Setup ZSH?"; then
  $DOTFILES_DIR/installs/setup-zsh.sh
fi

if promptYn "Install kitty?"; then
  $DOTFILES_DIR/installs/kitty.sh
fi

if promptYn "Install Tmux?"; then
  $DOTFILES_DIR/installs/tmux.sh
fi

if promptYn "Install Starship?"; then
  $DOTFILES_DIR/installs/starship.sh
fi

if promptYn "Install Neovim?"; then
  $DOTFILES_DIR/installs/neovim.sh
fi

if promptYn "Install Node?"; then
  $DOTFILES_DIR/installs/git-delta.sh
fi

if promptYn "Install Go?"; then
  $DOTFILES_DIR/installs/go.sh
fi

if promptYn "Install Rust?"; then
  $DOTFILES_DIR/installs/rust.sh
fi

if promptYn "Install Ocaml?"; then
  $DOTFILES_DIR/installs/ocaml.sh
fi

if promptYn "Install Terraform?"; then
  $DOTFILES_DIR/installs/terraform.sh
fi

if promptYn "Install Docker?"; then
  $DOTFILES_DIR/installs/docker.sh
fi

if promptYn "Install VSCode?"; then
  $DOTFILES_DIR/installs/vscode.sh
fi
