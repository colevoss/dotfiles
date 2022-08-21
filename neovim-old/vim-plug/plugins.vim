" auto-install vim-plug

call plug#begin('~/.vim/plugged')

  " Better Syntax Support
  Plug 'sheerun/vim-polyglot'

  " NERDTree
  " Plug 'preservim/nerdtree'

  " Auto pairs for '(' '[' '{'
  Plug 'jiangmiao/auto-pairs'

  " Dracula Theme
  Plug 'dracula/vim', { 'as': 'dracula' }

  " Stabe version of coc
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Commentary
  Plug 'tpope/vim-commentary'

  " Which Key
  Plug 'liuchengxu/vim-which-key'

  " Startify
  Plug 'mhinz/vim-startify'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'

  Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-fugitive'
  " Plug 'tpope/vim-rhubarb'
  " Plug 'junegunn/gv.vim'

  " Lightline
  Plug 'itchyny/lightline.vim'

  Plug 'voldikss/vim-floaterm'

  Plug 'ntpeters/vim-better-whitespace'
call plug#end()

