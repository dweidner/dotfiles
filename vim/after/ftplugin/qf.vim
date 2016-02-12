" after/ftplugin/qf.vim

" Ignore the quickfix buffer when cycling
setlocal nobuflisted

" Avoid text wrapping in quickfix windows
setlocal nowrap

" Prefer absolute linenumbers in the quickfix windows
setlocal number norelativenumber

" Ack.vim like keymappings:
" o - open file
" O - open file and close quickfix window
" t - open file in a new tab
" h - open file in horizontal split
" v - open file in vertical split
" q - close quickfix window
nnoremap <buffer> <silent> o <CR>
nnoremap <buffer> <silent> O <CR><C-W>p<C-W>c
nnoremap <buffer> <silent> t <C-W><CR><C-W>T
nnoremap <buffer> <silent> h <C-W><CR><C-W>K
nnoremap <buffer> <silent> v <C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t
nnoremap <buffer> <silent> q :cclose<Bar>:lclose<CR>
