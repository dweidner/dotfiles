" plugin/emmet.plugin.vim

" Avoid loading emmet globally
let g:user_emmet_install_global = 0

" Expand emmet abbreviation or jump to next placeholder
function! s:EmmetExpandOrJump()
  if (match(getline('.'), '<.*>')) >= 0
    return "\<plug>(emmet-move-next)"
  endif
  return "\<plug>(emmet-expand-abbr)"
endfunction

augroup vimrc_emmet

  au!

  " Load emmet plugin for specific file types
  au FileType html,html.twig,php,css,scss,sass EmmetInstall

  " Expand abbreviation or jump to next placeholder
  au FileType html,html.twig,php,css,scss,sass imap <buffer><expr><silent> <C-k> <sid>EmmetExpandOrJump()

augroup END
