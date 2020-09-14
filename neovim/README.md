# Neovim

My Neovim set up is _heavily_ influenced by [Chris@Machine's](https://github.com/ChristianChiarulli/nvim) setup.
You can find information about his set up on his [blog](https://www.chrisatmachine.com/neovim).

## Install Neovim

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

Open Neovim with `nvim` and run the `:PlugInstall` command to install all plugins.
Once plugins are installed you will probably need to close and re-open neovim
so CoC can install its plugins.

## Plugins

- _[Polyglot](https://github.com/sheerun/vim-polyglot)_ for better syntax highlighting
- _[Auto Pairs](https://github.com/jiangmiao/auto-pairs)_ for quote and bracken auto closing
- _[Dracula Theme](https://github.com/dracula/vim)_
- _[CoC](https://github.com/neoclide/coc.vim)_ For a whole lot of language stuff
