" after/ftplugin/javascript.vim

" Quickly move between functions
" @see <https://github.com/romainl/dotvim>
nnoremap <silent> <buffer> ]] :call custom#Jump('/function')<CR>
nnoremap <silent> <buffer> [[ :call custom#Jump('?function')<CR>
