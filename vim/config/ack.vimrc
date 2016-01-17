" ACK.VIMRC

if executable('ag')
  let g:ackprg='ag --vimgrep'
  let g:ack_use_dispatch=1
endif

