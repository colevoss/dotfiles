#!/bin/bash

DOTFILES_DIR=$HOME/dotfiles_test

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
  echo "HAVEN INSTALLED Dev tools"

  abort """
  Dev tools is not installed.
  Run `xcode-select --install`
  or download from Apple's website:
  Download XCode from Apple's Website: https://developer.apple.com/xcode/
  """
fi

if ! command -v brew >/dev/null
then
  if promptYn "Install Homebrew?"; then
    echo "Installing Homebrew"

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo '# Set PATH, MANPATH, etc., for Homebrew.' >> $HOME/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"

    exec zsh
  fi
fi

echo "Cloning dotfiles repo"
echo ""

if promptYn "Clone Repo?"; then
  rm -rf $DOTFILES_DIR
  git clone --progress git@github.com:colevoss/dotfiles.git $DOTFILES_DIR
fi

if promptYn "Install Apps?"; then
  $DOTFILES_DIR/setup/install-apps.sh
fi

if promptYn "Setup Terminal?"; then
  $DOTFILES_DIR/setup/prepare-terminal.sh
fi

if promptYn "Install Node?"; then
  $DOTFILES_DIR/setup/setup-node.sh
fi

if promptYn "Install Rust?"; then
  $DOTFILES_DIR/setup/install-rust.sh
fi

if promptYn "Install Go?"; then
  $DOTFILES_DIR/setup/install-go.sh
fi
