" config/misc.vim

" Jump to last known position
" @see help docs on last-position-jump
augroup dotrlp
  au!
  au dotrlp BufReadPost *
    \ if (&ft !~ '^git\c') && line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif
augroup end

" Load matchit.vim which is shipped with
" vim in version 7.x
if !exists('g:loaded_matchit') && findfile('bundle/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
