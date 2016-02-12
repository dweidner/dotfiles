" after/ftplugin/markdown.vim

" Quickly move between headlines
nnoremap <silent> <buffer> ]] :call jump#Jump('/^#.*')<CR>
nnoremap <silent> <buffer> [[ :call jump#Jump('?^#.*')<CR>
