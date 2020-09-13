
" Map leader to which_key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
" let g:which_key_sep = '→'
" set timeoutlen=100

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

let g:which_key_map['e'] = [ ':CocCommand explorer'       , 'explorer' ]
let g:which_key_map['f'] = [ ':Files'                     , 'search files' ]
" let g:which_key_map['t'] = [ ':FloatTerm'                     , 'flllllllllllllll' ]
" let g:which_key_map['t'] = [ ':FloatTerm', 'floaterm' ]

let g:which_key_map.z = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=normal'        , 'terminal'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ }
      " \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      " \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      " \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      " \ 'n' : [':FloatermNew node'                              , 'node'],
      " \ 'N' : [':FloatermNew nnn'                               , 'nnn'],
      " \ 'p' : [':FloatermNew python'                            , 'python'],
      " \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      " \ 't' : [':FloatermToggle'                                , 'toggle'],
      " \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      " \ 's' : [':FloatermNew ncdu'                              , 'ncdu'],
      " \ }

call which_key#register('<Space>', "g:which_key_map")
