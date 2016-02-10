" plugin/supertab.plugin.vim

" Use file completion, before trying to complete a method/field/etc...
let g:SuperTabDefaultCompletionType = 'context'

augroup vimrc_supertab

  au!

  " Prioritize omni completion results
  au FileType *
    \ if &omnifunc != '' |
    \   call SuperTabChain(&omnifunc, "<c-p>")
    \ endif

augroup END
