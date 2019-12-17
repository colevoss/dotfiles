# This is my dotfiles, YO!

## Clone Repo

```bash
git clone git@github.com:colevoss/dotfiles.git $HOME/dotfiles && cd $HOME/dotfiles
```

## Make Scripts Executable

_Make sure you are in the `dotfiles` directory_

```bash
chmod -R +x ./scripts
```

## Install Homebrew and Apps

```bash
./scripts/homebrew-setup.sh
```

## Install Oh My Zsh

```bash
./scripts/install-zsh.sh
```

> Close and reopen terminal to let Oh My Zsh do its thing

## Configure ZSH

```bash
./scripts/zsh-setup.sh
```

> Close and reopen terminal to let Oh My Zsh do its thing
