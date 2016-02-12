" after/ftplugin/javascript.vim

" Quickly move between functions
" @see <https://github.com/romainl/dotvim>
nnoremap <silent> <buffer> ]] :call jump#Jump('/function')<CR>
nnoremap <silent> <buffer> [[ :call jump#Jump('?function')<CR>
