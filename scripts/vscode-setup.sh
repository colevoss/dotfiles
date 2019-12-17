#!/bin/bash

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

  code --install-extension aaron-bond.better-comments
  code --install-extension alexkrechik.cucumberautocomplete
  code --install-extension bungcip.better-toml
  code --install-extension christian-kohler.npm-intellisense
  code --install-extension CoenraadS.bracket-pair-colorizer
  code --install-extension DanSnow.vscode-dockerfilelint
  code --install-extension DavidAnson.vscode-markdownlint
  code --install-extension dbaeumer.vscode-eslint
  code --install-extension dracula-theme.theme-dracula
  code --install-extension eamodio.gitlens
  code --install-extension ee92.folderize
  code --install-extension esbenp.prettier-vscode
  code --install-extension Gruntfuggly.todo-tree
  code --install-extension mikestead.dotenv
  code --install-extension ms-azuretools.vscode-docker
  code --install-extension ms-vscode-remote.remote-containers
  code --install-extension ms-vscode.vscode-typescript-tslint-plugin
  code --install-extension ms-vsliveshare.vsliveshare
  code --install-extension nelnet-velocity.velocity-workflow
  code --install-extension redhat.vscode-yaml
  code --install-extension sainnhe.forest-theme
  code --install-extension streetsidesoftware.code-spell-checker
  code --install-extension vscode-icons-team.vscode-icons
  code --install-extension vscodevim.vim
  code --install-extension xabikos.JavaScriptSnippets
  code --install-extension yzhang.markdown-all-in-one
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