" plugin/ctrlp.plugin.vim

" Customize the path of the cache files
let g:ctrlp_cache_dir = g:vim_home_dir . '/tmp/ctrlp'

" By default start CtrlP in the last used mode
let g:ctrlp_cmd = 'CtrlPLastMode'

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
    \ -g ""'
endif

" Search by filename
nnoremap <Leader>p :CtrlP<CR>

" Search symbols in current file
nnoremap <Leader>r :CtrlPBufTag<CR>

