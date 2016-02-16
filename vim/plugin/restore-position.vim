" plugin/restore-position.vim

" Jump to last known position
" @see help docs on last-position-jump

" Create a new autocmd group for the plugin
augroup dotrlp
  au!
augroup end

" Restore last position if it differs from the first/last line of the document
au dotrlp BufReadPost *
  \ if (&ft !~ '^git\c') && line("'\"") > 1 && line("'\"") <= line("$") |
  \   execute "normal! g`\"" |
  \ endif
