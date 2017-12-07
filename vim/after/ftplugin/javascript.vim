" after/ftplugin/javascript.vim
"
" @file Configuration applied for javascript files


" Auto format the current file using eslint
if executable('eslint')
  nnoremap <silent><special><buffer>
        \ <Leader>=
        \ :silent !eslint --fix -- %<CR>:checktime<CR>
endif
