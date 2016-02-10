" plugin/plugin-matchit.vim

" Load matchit.vim which is shipped with vim in version 7.x
if !exists('g:loaded_matchit') && findfile('bundle/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
