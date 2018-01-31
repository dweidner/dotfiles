" plugin/localization.vim
"
" @file Make VIM’s key bindings more accessible on certain keyboards


" Get a list of system locales
let s:languages = dw#Languages()

" Some key mappings are hard to reach on a german keyboard. As a workaround I
" remap the Umlaut keys on a german keyboard to the corresponding keys in an
" ASCII/US layout. That helps at least in vim’s normal mode.
function! s:ImproveGermanKeyboard() abort

  " Jump forward/backward
  map ü [
  map + ]
  noremap Ü {
  noremap * }
  map üü [[
  map ++ ]]
  map ü+ []
  map +ü ][

  " Search forward/backward
  noremap - /
  noremap _ ?

  " Search word under cursor forward/backward
  noremap ' *

  " Repeat latest f, t, F or T
  noremap ö ;
  noremap Ö :

  " Jump to mark/Execute contents of register
  noremap ä '
  noremap Ä @

  " Jump to the definition of the word under cursor
  nnoremap <Leader>+ g<C-]>
  vnoremap <Leader>+ g<C-]>
  nnoremap <Leader>* <C-w>g}
  vnoremap <Leader>* <C-w>g}

  " Auto format current buffer
  nmap <silent> <Leader>´ <Leader>=

endfunction

" Assume the use of a german keyboard if german is part of the current locale
if index(s:languages, 'de_DE') >= 0
  call s:ImproveGermanKeyboard()
endif
