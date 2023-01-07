#!/usr/bin/env bash

installNVM() {
  echo -e "\n============================="
  echo -e "Installing Node Version Manager (N)"
  echo -e "=============================\n"

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

  export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

installNodeVersions() {
  nvm install --lts
  nvm alias default node
}

installNVM
installNodeVersions