" config/misc.vim

" -------------------------------------
" Table of Contents
" -------------------------------------
" 1. MacVim
" 2. MatchIt
" 3. Autocommands
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
    write
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


" 2. MatchIt -------------------------- {{{1

" Load matchit.vim which is shipped with
" vim in version 7.x
if !exists('g:loaded_matchit') && findfile('bundle/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif


" 3. Autocommands --------------------- {{{1

augroup dotmisc

  au!

  " Jump to last known position
  " @see help docs on last-position-jump
  au BufReadPost *
    \ if (&ft !~ '^git\c') && line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

  " Terminal.app does not change the cursor
  " when switching between normal mode and
  " insert mode. We change the color of the
  " current line number here to make the
  " active insert mode more obvious.
  if ($TERM_PROGRAM == 'Apple_Terminal')
    au InsertEnter * exe printf('hi! CursorLineNr ctermfg=%s ctermbg=2', &bg == 'dark' ? 15 : 8)
    au InsertLeave * exe printf('hi! CursorLineNr ctermfg=%s ctermbg=none', &bg == 'dark' ? 11 : 130)
  endif

  " Close help window with <q>
  au FileType help nn <silent><buffer> q :q<CR>
  au FileType help nn <silent><buffer> Q :q<CR>

augroup end

" Lazy loads some plugins on first InsertEnter
augroup dotlazyload
  au!
  au InsertEnter * call call('plug#load', g:plug_lazyload)
        \| call UltiSnips#FileTypeChanged()
        \| au! dotlazyload
augroup end


" vim:foldmethod=marker:foldlevel=2
