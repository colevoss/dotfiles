#!/usr/bin/env bash

createInstallFile() {
  echo "#!/usr/bin/env bash" > $HOME/dotfiles/scripts/vscode-install-extensions.sh
}

exportExtensions() {
  code --list-extensions | xargs -L 1 echo code --install-extension >> $HOME/dotfiles/scripts/vscode-install-extensions.sh
}

main() {
  createInstallFile
  exportExtensions
}

main