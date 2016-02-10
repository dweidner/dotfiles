" plugin/emmet.plugin.vim

" Avoid loading emmet globally
let g:user_emmet_install_global = 0

" Decide whether to jumb to next placeholder or to expand abbreviation
function! s:EmmetExpandOrJump()
  let l=getline('.')
  if (match(l, '<.*>')) >= 0
    return "\<plug>(emmet-move-next)"
  endif
  return "\<plug>(emmet-expand-abbr)"
endfunction

augroup vimrc_emmet

  au!

  " Load emmet plugin for specific file types
  au FileType html,html.twig,php,css,scss,sass EmmetInstall

  " Provide custom keybinding to expand emmet abbreviations
  au FileType html,html.twig,php,css,scss,sass imap <buffer><expr><silent> <C-e> <sid>EmmetExpandOrJump()

augroup END
