" plugin/auto-mkdir.vim

" Create intermediate directories as desired when writing new files.
" @see <https://github.com/jasoncodes/dotfiles/>
function! s:AutoMkdir(file, buffer)
  let buftype = getbufvar(a:buffer, '&buftype')

  " Ensure the current buffer is a normal buffer and the file to create is not
  " a remote file
  if empty(buftype) && a:file !~# '\v^\w+\:\/'
    " Remove the last component and any separators from the file path
    let dir = fnamemodify(a:file, ':h')

    " Create intermediate directory if it does not exist
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction

" Ensure that intermedia directories are created, before writing a file
augroup dotautomkdir
  au!
  au BufWritePre * :call s:AutoMkdir(expand('<afile>'), +expand('<abuf>'))
augroup end
