" CTRLP.VIMRC

let g:ctrlp_line_prefix=''          " Avoid adding a prefix to each file in the list

" Use `The Silver Searcher` if available
if executable('ag')
  let g:ctrlp_user_command = 'ag %s
    \ --nocolor --nogroup -g ""
    \ --files-with-matches
    \ --ignore=".git"
    \ --ignore=".svn"
    \ --ignore=".hg"
    \ --ignore="node_modules"'
endif

" Search in buffer list using CtrlP
nn <Leader>b :CtrlPBuffer<CR>

" Search symbols in current buffer
nn <Leader>s :CtrlPBufTag<CR>

" Search most recent used files
nn <Leader>mru :CtrlPMRU<CR>

