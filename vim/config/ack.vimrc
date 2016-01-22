" ACK.VIMRC

" 1. Configuration -------------------- {{{1

" Use the silver searcher if available
if executable('ag')
  let g:ackprg='ag --vimgrep'
  let g:ack_use_dispatch=1
endif


" vim:foldmethod=marker:foldlevel=2
