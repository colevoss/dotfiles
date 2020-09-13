call plug#begin('~/.vim/plugged')

set noerrorbells
set number
set showcmd

set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch " highlight search results
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set backspace=indent,eol,start

set noswapfile
set nobackup
set nowritebackup
set splitright
set splitbelow
set encoding=UTF-8
set autoread
set ttyfast

set laststatus=2
set noshowmode

set nocursorcolumn
" set nocursorline

set autoindent
set smartindent

set smarttab
set tabstop=2
set shiftwidth=2
set expandtab

let mapleader = ","
let g:mapleader = ","

" nmap ; :
nmap <leader>, :w<cr>

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

set list
set listchars=tab:→\ ,eol:.,trail:⋅,extends:❯,precedes:❮

" set cursorline

vmap < <gv
vmap > >gv

" <NERDTree>
Plug 'preservim/nerdtree', { 'on': [ 'NERDTreeToggle', 'NERDTreeFind' ] }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

map <C-n> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
let NERDTreeNodeDelimiter = "\u263a" " smiley face

augroup nerdtree
  autocmd!
  autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
  " autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
augroup END

let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ 'Ignored'   : '☒',
        \ "Unknown"   : "?"
        \ }

" </NERDTree>

" <FzF>
"
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

if isdirectory(".git")
  " if in a git project, use :GFiles
  nmap <silent> <leader>t :GitFiles --cached --others --exclude-standard<cr>
else
  " otherwise, use :FZF
  nmap <silent> <leader>t :FZF<cr>
endif

nmap <silent> <leader>s :GFiles?<cr>
nmap <silent> <leader>r :Buffers<cr>

" </FzF>

" <COC>
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" </COC>

" <Startify>
function! ListCommits()
  let git = 'git -C ' . getcwd()
  let commits = systemlist(git . ' log --oneline | head -n5')
  let git = 'G' . git[1:]
  return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction

function! GitModified()
  let files = systemlist('git ls-files -m 2>/dev/null')
  return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! GitUntracked()
  let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
  return map(files, "{'line': v:val, 'path': v:val}")
endfunction

Plug 'mhinz/vim-startify'

let g:startify_change_to_dir=0
let g:startify_custom_header = [ ]
let g:startify_relative_path = 1
let g:startify_use_env = 1

let g:startify_lists = [
  \ { 'type': 'dir', 'header': [ 'Files '. getcwd() ] },
  \ { 'type': function('GitModified'),  'header': ['Git modified']},
  \ { 'type': function('GitUntracked'), 'header': ['Git untracked']},
  \ { 'type': 'bookmarks', 'header': [ 'Bookmarks' ] },
  \ { 'type': 'commands',  'header': [ 'Commands' ] },
  \ ]

let g:startify_commands = [
  \ { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
  \ { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
  \ ]

let g:startify_bookmarks = [
  \ { 'v': '~/.config/nvim/init.vim' },
  \ { 'df': '~/dotfiles' },
  \ ]

" </Startify>

Plug 'tpope/vim-fugitive'
Plug 'sodapopcan/vim-twiggy'
Plug 'rbong/vim-flog'

Plug 'itchyny/lightline.vim'

function! FileName() abort
  let filename = winwidth(0) > 70 ? expand('%') : expand('%:t')
  if filename =~ 'NERD_tree'
      return ''
  endif
  let modified = &modified ? ' +' : ''
  return fnamemodify(filename, ":~:.") . modified
endfunction

let g:lightline = {
            \   'colorscheme': 'dracula',
            \   'active': {
            \       'left': [ [ 'mode', 'paste' ],
            \               [ 'gitbranch' ],
            \               [ 'readonly', 'filetype', 'filename' ]],
            \       'right': [ [ 'percent' ], [ 'lineinfo' ],
            \               [ 'gitblame', 'currentfunction',  'cocstatus', 'linter_errors', 'linter_warnings' ]]
            \   },
            \   'component_expand': {
            \   },
            \   'component_type': {
            \       'readonly': 'error',
            \       'linter_warnings': 'warning',
            \       'linter_errors': 'error'
            \   },
            \   'component_function': {
            \       'filename': 'FileName',
            \       'filetype': 'WebDevIconsGetFileTypeSymbol',
            \       'gitbranch': 'FugitiveHead',
            \       'cocstatus': 'coc#status',
            \       'currentfunction': 'helpers#lightline#currentFunction',
            \       'gitblame': 'helpers#lightline#gitBlame'
            \   },
            \   'tabline': {
            \       'left': [ [ 'tabs' ] ],
            \       'right': [ [ 'close' ] ]
            \   },
            \   'tab': {
            \       'active': [ 'filename', 'modified' ],
            \       'inactive': [ 'filename', 'modified' ],
            \   },
            \   'separator': { 'left': '', 'right': '' },
            \   'subseparator': { 'left': '', 'right': '' }
        \ }

Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'sickill/vim-pasta'


Plug 'liuchengxu/vim-which-key'
nnoremap <silent> <leader> :<c-u>WhichKey  ','<CR>


call plug#end()
