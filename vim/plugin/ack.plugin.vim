" plugin/ack.plugin.vim

" Use the silver searcher if available
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  let g:ack_use_dispatch = 1
endif

" Search with Ack.vim
nnoremap <C-f> :call ack#Ack('grep<bang>', input('Search: ', expand('<cword>')))<CR>
