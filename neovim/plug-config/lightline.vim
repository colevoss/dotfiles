set laststatus=2
" lightline
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'ctrlpmark', 'git', 'diagnostic', 'cocstatus', 'filename', 'method' ]
      \   ],
      \   'right':[
      \     [ 'filetype', 'lineinfo' ],
      \     [ 'status', 'blame', 'currentFunction' ]
      \   ],
      \ },
      \ 'component_function': {
      \   'status': 'LightlineGitStatus',
      \   'blame': 'LightlineGitBlame',
      \   'currentFunction': 'LighlineCurrentFunction'
      \ }
      \ }

function! LightlineGitStatus() abort
  let status = get(g:, 'coc_git_status', '')
  " return blame
  return winwidth(0) > 120 ? status : ''
endfunction

function! LighlineCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! LightlineGitBlame()
    return winwidth(0) > 100 ? strpart(substitute(get(b:, 'coc_git_blame', ''), '[\(\)]', '', 'g'), 0, 50) : ''
    " return winwidth(0) > 100 ? strpart(get(b:, 'coc_git_blame', ''), 0, 20) : ''
endfunction

autocmd User CocStatusChange, CocDiagnosticChange call lightline#update()

