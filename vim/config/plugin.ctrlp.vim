" config/plugin.ctrlp.vim

" Customize the path of the cache files
let g:ctrlp_cache_dir = g:vim_home_dir . '/tmp/ctrlp'

" Allow to prefix <C-p> with a count to start in a specific mode
let g:ctrlp_cmd = 'exe "CtrlP" . get(["", "Buffer", "MRU", "BufTag"], v:count)'

" Avoid adding a prefix to each entry in the list
let g:ctrlp_line_prefix = ''

" Use `The Silver Searcher` if available
if executable('ag')
  let g:ctrlp_user_command = 'ag %s
    \ --literal
    \ --nocolor
    \ --nogroup
    \ --depth 40
    \ --files-with-matches
    \ --skip-vcs-ignores
    \ -g ""'
endif

" Search symbols in current file
nnoremap <Leader>r :CtrlPBufTag<CR>
