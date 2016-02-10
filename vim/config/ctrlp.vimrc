" CTRLP.VIMRC

" 1. Configuration -------------------- {{{1
"
let g:ctrlp_line_prefix=''              " Avoid adding a prefix to each file in the list

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


" 2. Key bindings --------------------- {{{1

" Search by filename
nn <Leader>p :CtrlPLastMode<CR>

" Search symbols in current file
nn <Leader>r :CtrlPBufTag<CR>


" vim:foldmethod=marker:foldlevel=2
