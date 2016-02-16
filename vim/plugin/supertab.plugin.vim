" plugin/supertab.plugin.vim

" Create a new autocmd group for the plugin
augroup dotsupertab
  au!
augroup end

" Try to complete file path, members or properties first
let g:SuperTabDefaultCompletionType = 'context'

" Prioritize omni completion results
au dotsupertab FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \ endif
