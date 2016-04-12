" config/plugin.supertab.vim

" Try to complete file path, members or properties first
let g:SuperTabDefaultCompletionType = 'context'

" Prioritize omni completion results
augroup dotsupertab
  au!
  au FileType *
    \ if &omnifunc != '' |
    \   call SuperTabChain(&omnifunc, "<c-p>") |
    \ endif
augroup end


