" autoload/dw/node.vim
"
" @file Node specific utility functions


"
" Find a locally installed node package binary.
"
" @param {String} name
" @return {String}
"
function! dw#node#FindPackage(name) abort
  let l:bin = dw#project#FindFile('node_modules/.bin/' . a:name)

  if empty(l:bin) || !executable(l:bin)
    return ''
  endif

  return l:bin
endfunction
