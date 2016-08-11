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
" A helper function used to retrieve the absolute path of
" a locally installed node module.
" @see <http://blog.pixelastic.com/2015/10/05/use-local-eslint-in-syntastic/>
"
function! dw#GetNodeModulePath(module)
  if !executable('npm')
    return
  endif

  " Retrieve the path using the shell command which
  silent let path = system('PATH=$(npm bin):$PATH && which ' .  shellescape(a:module))
  if v:shell_error
    return
  endif

  " Trim whitespace from the path
  return substitute(path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
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
