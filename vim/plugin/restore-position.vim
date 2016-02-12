" plugin/restore-position.vim

" Jump to last known position
" @see help docs on last-position-jump

augroup vimrc_rlp

  au!

  au BufReadPost *
    \ if (&ft != 'gitcommit') && line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

augroup END
