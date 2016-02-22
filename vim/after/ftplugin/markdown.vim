" after/ftplugin/markdown.vim

" Quickly move between headlines
nnoremap <silent> <buffer> ]] :call custom#Jump('/^#.*')<CR>
nnoremap <silent> <buffer> [[ :call custom#Jump('?^#.*')<CR>

" Hide the line and column number of the cursor position
setl noruler

" Hide the line number in front of each line
setl nonumber norelativenumber
