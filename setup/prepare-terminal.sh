#!/usr/bin/env bash

function installLibraries() {
  brew bundle --file $HOME/dotfiles/brewfiles/terminal.Brewfile
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

  $HOME/dotfiles/setup/fix-tmux-italics.sh

  echo -e "\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  echo -e "Remember to press \"prefix\" + I to install plugins"
  echo -e "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n"
}

setupZsh() {
  echo -e "\n============================="
  echo -e "Configuring ZSH"
  echo -e "=============================\n"

  if [ ! -d "$HOME/.zsh" ]; then
    echo -e "\nCreating $HOME/.zsh directory...\n"
    mkdir -p -v $HOME/.zsh
  fi

  echo -e "\nLinking dotfiles zshrc..."
  ln -s -f -v $HOME/dotfiles/zsh/zshrc $HOME/.zshrc

  mkdir -p $HOME/.zsh/custom-completions
  fpath=($HOME/.zsh/zsh-completions/src $fpath)
  fpath=($HOME/.zsh/custom-completions $fpath)

  rm -f ~/.zcompdump; compinit
}

setupStarship() {
  echo -e "\n============================="
  echo -e "Setting up Starship"
  echo -e "=============================\n"

  if [ ! -d "$HOME/.config" ]; then
    echo -e "Creating $HOME/.config dir..."
    mkdir -p $HOME/.config # make config directory if necessary
  fi

  echo -e "Linking dotfiles starship file..."
  ln -s -f -v $HOME/dotfiles/starship/starship.toml $HOME/.config/starship.toml
}

setupLf() {
  echo -e "\n============================="
  echo -e "Setting up LF"
  echo -e "=============================\n"

  if [ ! -d "$HOME/.config/lf" ]; then
    echo -e "Creating $HOME/.config/lf dir..."
    mkdir -p $HOME/.config/lf
  fi

  echo -e "Linking dotfiles lfrc..."
  ln -s -f -v $HOME/dotfiles/lf/lfrc $HOME/.config/lf/lfrc

  # Sets up cd on quit
  # @see https://github.com/gokcehan/lf/wiki/Tutorial#working-directory
  echo -e "Downloading lfcd script..."
  curl https://raw.githubusercontent.com/gokcehan/lf/master/etc/lfcd.sh -o ~/.config/lf/lfcd.sh
}

setupDelta() {
  echo -e "\n============================="
  echo -e "Setting up Git Delta"
  echo -e "=============================\n"

  git config --global core.pager "delta"
  git config --global interactive.diffFilter "delta --color-only"
  git config --global delta.navigate true
  git config --global delta.light false 
  git config --global merge.conflictStyle "diff3"
  git config --global diff.colorMoved "default"
  git config --global delta.side-by-side true
}

setupFzf() {
  echo -e "\n============================="
  echo -e "Setting up Git Delta"
  echo -e "=============================\n"
  $(brew --prefix)/opt/fzf/install
}

installLibraries
setupZsh
setupLf
setupStarship
setupDelta
setupFzf
configureTmux
