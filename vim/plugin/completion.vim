" plugin/completion.vim

augroup vimrc_omnifocus

  au!

  " Enable omni completion for a given set of frequently used languages
  au FileType css           setlocal omnifunc=csscomplete#CompleteCSS
  au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  au FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
  au FileType php           setlocal omnifunc=phpcomplete#CompletePHP

augroup END

