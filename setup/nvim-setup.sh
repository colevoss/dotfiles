#!/usr/bin/env bash

setupNvim() {
  rm -rf $HOME/.config/nvim
  # ln -s $HOME/dotfiles/neovim $HOME/.config/nvim
  ln -s $HOME/dotfiles/nvim $HOME/.config/nvim
}

instructions() {
  cat << "EOF"
               _              _____      _
            (_)            / ____|    | |
  _ ____   ___ _ __ ___   | (___   ___|
 | '_ \ \ / / | '_ ` _ \   \___ \ / _ \ __| | | | '_ \
 | | | \ V /| | | | | | |  ____) |  __/ |_| |_| | |_) |
 |_| |_|\_/ |_|_| |_| |_| |_____/ \___|\__|\__,_| .__/
                                                | |
                                                |_|
EOF

  # echo "Open vim with nvim and run :PlugInstall"
  echo "Open vim with nvim and run :PackerInstall"
}

attemptNpmPackageInstalls() {
  if [ ! command -v npm &> /dev/null]; then
    echo -e "!!!!!!!!!!!!!!!!!!"
    echo -e "npm is not install. Cannot install nvim dependencies"
    echo -e "!!!!!!!!!!!!!!!!!!"

    return 1
  fi

  npm install -g eslint_d @fsouza/prettierd
}

setupNvim
attemptNpmPackageInstalls
instructions