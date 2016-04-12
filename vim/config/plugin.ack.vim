" config/plugin.ack.vim

" Use the silver searcher if available
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  let g:ack_use_dispatch = 1
endif
