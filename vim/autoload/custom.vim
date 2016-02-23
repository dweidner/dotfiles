" autoload/custom.vim

" Perform a motion but preserve search history.
" @see $VIMRUNTIME/ftplugin/python.vim
function! custom#Jump(motion) range
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

