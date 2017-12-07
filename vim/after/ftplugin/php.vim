" after/ftplugin/php.vim
"
" @file Configuration applied for PHP files


" Auto format the current file using PHP Code Sniffer
if executable('phpcbf')
  nnoremap <buffer><silent><special>
        \ <Leader>=
        \ :silent %!phpcbf<CR>:redraw!<CR>
endif
