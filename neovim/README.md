# Neovim

My Neovim set up is _heavily_ influenced by [Chris@Machine's](https://github.com/ChristianChiarulli/nvim) setup.
You can find information about his set up on his [blog](https://www.chrisatmachine.com/neovim).

## Install Neovim

```bash
brew install neovim
```

## Intsall vim-plug

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Link config files

```bash
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim
```

Open Neovim with `nvim` and run the `:PlugInstall` command to install all plugins.
Once plugins are installed you will probably need to close and re-open neovim
so CoC can install its plugins.

## Plugins

- **[Polyglot](https://github.com/sheerun/vim-polyglot)** for better syntax highlighting
- **[Auto Pairs](https://github.com/jiangmiao/auto-pairs)** for quote and bracken auto closing
- **[Dracula Theme](https://github.com/dracula/vim)**
- **[CoC](https://github.com/neoclide/coc.nvim)** For a whole lot of language stuff
