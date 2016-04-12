" config/completion.vim

" Select completion function for frequently used languages
augroup dotcompletion
  au!
  au FileType javascript    setl omnifunc=javascriptcomplete#CompleteJS
  au FileType php           setl omnifunc=phpcomplete#CompletePHP
  au FileType css           setl omnifunc=csscomplete#CompleteCSS
  au FileType html,markdown setl omnifunc=htmlcomplete#CompleteTags
augroup end
