#!/usr/bin/env bash

fixKeyRepeatJunk() {
  echo -e "\n============================="
  echo -e "Fixing Vim Key Repeat Issue"
  echo -e "=============================\n"

  defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
}

installExtensions() {
  echo -e "\n============================="
  echo -e "Installing VSCode Extensions"
  echo -e "=============================\n"

  $HOME/dotfiles/scripts/vscode-install-extensions.sh
}

configureSettings() {
  echo -e "\n============================="
  echo -e "Configuring VSCode Settings"
  echo -e "=============================\n"

  cat $HOME/dotfiles/vscode-settings.json > $HOME/Library/Application\ Support/Code/User/settings.json
}

main() {
  while true
  do
  read -p "Would you like to install extensions? [yN] " answer

  case $answer in
        [yY]* ) installExtensions
                fixKeyRepeatJunk
                break;;
        [nN] )  break;;
        * )     echo "Please enter Y or N.";
                break;;
        esac
        done

  while true
  do
  read -p "Would you like to configure VSCode settings? [yN] " answer

  case $answer in
        [yY]* ) configureSettings 
                break;;
        [nN] )  break;;
        * )     echo "Please enter Y or N.";
                break;;
        esac
        done
}

main