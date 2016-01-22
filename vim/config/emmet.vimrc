" EMMET.VIMRC

" 1. Configuration -------------------- {{{1

let g:user_emmet_install_global=0      " Avoid loading emmet globally


" 2. Functions & Helpers -------------- {{{1

function! s:EmmetExpandOrJump()
  let l=getline('.')
  if (match(l, '<.*>')) >= 0
    return "\<plug>(emmet-move-next)"
  endif
  return "\<plug>(emmet-expand-abbr)"
endfunction


" 3. AUTOCMD -------------------------- {{{1

augroup vimrc_emmet

  au!

  " Load emmet plugin for specific file types
  au FileType html,html.twig,php,css,scss,sass EmmetInstall

  " Provide custom keybinding to expand emmet abbreviations
  au FileType html,html.twig,php,css,scss,sass imap <buffer><expr><silent> <C-e> <sid>EmmetExpandOrJump()

augroup END


" vim:foldmethod=marker:foldlevel=2
