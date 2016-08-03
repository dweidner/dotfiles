" config/misc.vim

" -------------------------------------
" Table of Contents
" -------------------------------------
" 1. MacVim
" 2. Autocommands
" -------------------------------------


" 1. MacVim --------------------------- {{{1

if executable('mvim')

  " Custom function  to open a give set
  " of files in MacVim
  function! s:OpenInMacVim(...)
    let files = ''

    " Escape file names. Use current file
    " if no file name was given.
    if (a:0 == 0)
      let files = expand('%:p')
    else
      for file in a:000
        if (filereadable(file))
          let files .= ' ' . shellescape(file, 1)
        endif
      endfor
    endif

    " Save the current file and open MacVim
    update
    echom files
    silent execute "!mvim " . files

    " Redraw the current window
    redraw!
  endfunction

  " Custom command to open MacVim with a
  " given set of files
  command -nargs=* -complete=file MacVim call <sid>OpenInMacVim(<f-args>)
  command -nargs=* -complete=file Mvim MacVim <args>

endif


" 2. Autocommands --------------------- {{{1

augroup vimrc

  " Close help window with <q>
  au FileType help nn <silent><buffer> q :q<CR>
  au FileType help nn <silent><buffer> Q :q<CR>

augroup end


" vim:foldmethod=marker:foldlevel=2
