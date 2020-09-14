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
- **[Dracula Theme](https://github.com/dracula/vim)** Its the best theme
- **[Commentary](https://github.com/tpope/vim-commentary)** Better commenting
- **[Which Key](https://github.com/liuchengxu/vim-which-key)** Shows key bindings in popup
- **[Startify](https://github.com/mhinz/vim-startify)** A fancy start screen
- **[FZF](https://github.com/junegunn/fzf)** Fuzzy finder
- **[Signify](https://github.com/mhinz/vim-signify)** Git Gutter alternate
- **[Fugitive](https://github.com/tpope/vim-fugitive)** Git integration
- **[Lightline](https://github.com/itchyny/lightline.vim)** Status bar
- **[Floaterm](https://github.com/voldikss/vim-floaterm)** Builtin terminal
- **[Better Whitespace](https://github.com/ntpeters/vim-better-whitespace)** Whitespace management
- **[CoC](https://github.com/neoclide/coc.nvim)** For a whole lot of language stuff
  - coc-snippets
  - coc-actions
  - coc-sh
  - coc-lists
  - coc-tasks
  - coc-pairs
  - coc-tsserver
  - coc-floaterm
  - coc-html
  - coc-css
  - coc-emoji
  - coc-cssmodules
  - coc-yaml
  - coc-python
  - coc-pyright
  - coc-explorer
  - coc-svg
  - coc-prettier
  - coc-vimlsp
  - coc-xml
  - coc-yank
  - coc-json
  - coc-marketplace
