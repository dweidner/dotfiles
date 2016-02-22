" plugin/ctrlp.plugin.vim

" Avoid adding a prefix to each entry in the list
let g:ctrlp_line_prefix = ''

" Use `The Silver Searcher` if available
if executable('ag')
  let g:ctrlp_user_command = 'ag %s
    \ --literal
    \ --nocolor
    \ --nogroup
    \ --depth 20
    \ --files-with-matches
    \ -g ""'
endif

" Search by filename
nnoremap <Leader>p :CtrlPLastMode<CR>

" Search symbols in current file
nnoremap <Leader>r :CtrlPBufTag<CR>

