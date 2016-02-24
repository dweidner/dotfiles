" after/ftplugin/markdown.vim

setl noruler                      " Hide the line and column number
setl nonumber norelativenumber    " Hide the line number
setl spell                        " Enable spell checking
setl complete+=kspell             " Use spell checking for keyword completion

" Highlight markdown fenced code properly
let g:markdown_fenced_languages = [
  \   'html',
  \   'javascript', 'js=javascript', 'json=javascript',
  \   'php',
  \   'sass',
  \ ]

" Quickly move between headlines
nnoremap <silent> <buffer> ]] :call util#Jump('/^#.*')<CR>
nnoremap <silent> <buffer> [[ :call util#Jump('?^#.*')<CR>
