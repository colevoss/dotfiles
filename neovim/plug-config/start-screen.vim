let g:startify_custom_header = [
         \ '',
         \ '      ___           ___           ___           ___',
         \ '     /\  \         /\  \         /\  \         /\  \',
         \ '    /::\  \       /::\  \       /::\  \       /::\  \',
         \ '   /:/\:\  \     /:/\:\  \     /:/\:\  \     /:/\:\  \',
         \ '  /:/  \:\  \   /:/  \:\  \   /:/  \:\__\   /::\~\:\  \',
         \ ' /:/__/ \:\__\ /:/__/ \:\__\ /:/__/ \:|__| /:/\:\ \:\__\',
         \ ' \:\  \  \/__/ \:\  \ /:/  / \:\  \ /:/  / \:\~\:\ \/__/',
         \ '  \:\  \        \:\  /:/  /   \:\  /:/  /   \:\ \:\__\',
         \ '   \:\  \        \:\/:/  /     \:\/:/  /     \:\ \/__/',
         \ '    \:\__\        \::/  /       \::/__/       \:\__\',
         \ '     \/__/         \/__/         ~~            \/__/',
         \]

let g:webdevicons_enable_startify = 1

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

let g:startify_bookmarks = [
            \ { 'df': '~/dotfiles' },
            \ '~/codes',
            \ ]

let g:startify_change_to_vcs_root = 1
