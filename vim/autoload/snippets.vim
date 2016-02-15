" autoload/snippets.vim

" Collection of helper functions used in various snippets

function! snippets#Filename(...)
  let filename = expand('%:t:r')
  if filename == ''
    return a:0 == 2 ? a:2 : ''
  endif
  return !a:0 || a:1 == '' ? filename : substitute(a:1, '$1', filename, 'g')
endf
