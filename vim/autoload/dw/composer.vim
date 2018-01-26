" autoload/dw/composer.vim
"
" @file Composer specific utility functions


"
" Find a locally installed binary installed via composer.
"
" @param {String} name
" @return {String}
"
function! dw#composer#FindPackage(name) abort
  let l:bin = dw#project#FindFile('vendor/.bin/' . a:name)

  if empty(l:bin) || !executable(l:bin)
    return ''
  endif

  return l:bin
endfunction

