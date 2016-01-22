" MATCHIT.VIMRC

" 1. Configuration -------------------- {{{1

" Load matchit.vim which is shipped with vim
if !exists('g:loaded_matchit') && findfile('bundle/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif


" vim:foldmethod=marker:foldlevel=2
