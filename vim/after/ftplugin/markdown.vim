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
nnoremap <silent> <buffer> ]] :call dw#Jump('/^#.*')<CR>
nnoremap <silent> <buffer> [[ :call dw#Jump('?^#.*')<CR>

" Preview file in Marked 2
if has('mac')
  command! Marked silent exe "!open -a 'Marked 2' '" . expand("%:p") . "'" | redraw!
  nnoremap <silent> <buffer> <Leader>m :<C-u>Marked<CR>
endif
