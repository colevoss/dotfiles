# VIM SETUP

## Install Neovim

`neovim` should be installed through Brewfile. If not...

```bash
brew install neovim
```

## Intsall `vim-plug`

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Link `dotfiles/nvim` to `.config/nvim`

```bash
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim
```
