#!/usr/bin/env bash

makeThemesDir() {
  echo -e "\n============================="
  echo -e "Making themes directory"
  echo -e "=============================\n"

  mkdir $HOME/.themes
}

installDraculaTheme() {
  echo -e "\n============================="
  echo -e "Installing Theme"
  echo -e "=============================\n"

  git clone https://github.com/dracula/iterm.git $HOME/.themes/iterm
}

configurationInstructions() {
  echo -e "\n============================="
  echo -e "Manual Setup"
  echo -e "============================="
  echo "
  - Open iTerm preferences
  - Profiles → Colors Tab
  - Open the Color Presets... drop-down in the bottom right corner
  - Select import... from the list
  - Navigate to ~/.themes/iterm/Dracula.itermcolors
  - Select Dracula theme from Color Presets... list
  "
}

makeThemesDir
installDraculaTheme
configurationInstructions