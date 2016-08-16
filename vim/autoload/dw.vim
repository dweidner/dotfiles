" autoload/dw.vim

if exists('g:loaded_dw') || &cp || version < 700
  finish
endif
let g:loaded_dw = 1

"
" Perform a motion but preserve search history.
" @see $VIMRUNTIME/ftplugin/python.vim
"
function! dw#Jump(motion) range
  let cnt = v:count1
  let save = @/
  mark '
  while cnt > 0
    silent! exe a:motion
    let cnt = cnt - 1
  endwhile
  call histdel('/', -1)
  let @/ = save
endfunction

"
" A helper function that installs bundle dependencies for the
" YouCompleteMe plugin.
"
function! dw#BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py --tern-completer
  endif
endfunction
