" autoload/util.vim

if exists('g:did_util_vim') || &cp || version < 700
  finish
endif
let g:did_util_vim = 1

" Perform a motion but preserve search history.
" @see $VIMRUNTIME/ftplugin/python.vim
function! util#Jump(motion) range
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


" A helper function used to retrieve the absolute path
" of a locally installed node module.
" @see <http://blog.pixelastic.com/2015/10/05/use-local-eslint-in-syntastic/>
function! util#GetNodeModulePath(module)
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
