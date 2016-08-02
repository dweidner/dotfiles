" config/plugin.ack.vim

" Use the silver searcher if available
if executable('ag')
  let &grepprg = 'ag --nogroup --nocolor --column'
endif
