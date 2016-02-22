" autoload/jump.vim

" Perform a motion buf do not affect search history.
" @see $VIMRUNTIME/ftplugin/python.vim
function! jump#Jump(motion) range
  let cnt = v:count1
  let save = @/            " save last search pattern
  mark '
  while cnt > 0
    silent! exe a:motion
    let cnt = cnt - 1
  endwhile
  call histdel('/', -1)
  let @/ = save            " restore last search pattern
endfunction

