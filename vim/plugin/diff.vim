" plugin/diff.vim

" Convenient command to see the different between the current
" buffer and the file it was loaded from.
" @see |:help :DiffOrig|
command DiffOrig vert new
      \ | set bt=nofile | read ++edit # | 0d_ | diffthis
      \ | wincmd p | diffthis
