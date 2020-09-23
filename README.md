# This is my dotfiles, YO!

### Clone Repo

```bash
git clone git@github.com:colevoss/dotfiles.git $HOME/dotfiles && cd $HOME/dotfiles
```

### Make Scripts Executable

_Make sure you are in the `dotfiles` directory_

```bash
chmod -R +x ./scripts
```

### Install Homebrew and Apps

```bash
./scripts/homebrew-setup.sh
```

### Install Oh My Zsh

```bash
./scripts/install-zsh.sh
```

> Close and reopen terminal to let Oh My Zsh do its thing

### Configure ZSH

```bash
./scripts/zsh-setup.sh
```

> Close and reopen terminal to let Oh My Zsh do its thing

### Configure Tmux

```bash
./scripts/tmux-setup.sh
```

### Setup Iterm

For now this only sets up the iTerm theme

```bash
./scripts/iterm-setup.sh
```

### Setup NVM

```bash
./scripts/install-nvm.sh
```

> Make sure the NVM path is only in the `.zshrc` once. NVM install appends this
> to `.zshrc` but it tries not to if it finds the path in there anyway. Worth making sure though.

### Setup VSCode

```bash
./scripts/vscode-setup.sh
```

This will prompt you for each step. You can install extensions and/or you copy settings
to VSCode's settings files.

This also fixes the Vim Key repeat issue.

## Exporting Brew

```bash
brew bundle dump file=$HOME/Brewfile.export
mv $HOME/Brewfile.export $HOME/dotfiles/Brewfile
```
