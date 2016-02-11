" plugin/supertab.plugin.vim

" Try to complete file path, members or properties first
let g:SuperTabDefaultCompletionType = 'context'

augroup vimrc_supertab

  au!

  " Prioritize omni completion results
  au FileType *
    \ if &omnifunc != '' |
    \   call SuperTabChain(&omnifunc, "<c-p>") |
    \ endif

augroup END
