" config/misc.vim

" Create a new auto command group
augroup dotmisc

  " Remove all commands for the current group
  au!

  " Jump to last known position
  " @see help docs on last-position-jump
  au BufReadPost *
    \ if (&ft !~ '^git\c') && line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

  " Close help window with <q>
  au FileType help nn <silent><buffer> q :q<CR>
  au FileType help nn <silent><buffer> Q :q<CR>

augroup end

" Load matchit.vim which is shipped with
" vim in version 7.x
if !exists('g:loaded_matchit') && findfile('bundle/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
