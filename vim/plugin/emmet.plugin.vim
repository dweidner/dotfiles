" plugin/emmet.plugin.vim

" Create a custom autocmd group for the emmet plugin
augroup dotemmet
  au!
augroup end

" Avoid loading emmet globally
let g:user_emmet_install_global = 0

" Load emmet plugin for specific file types only
au dotemmet FileType html,html.twig,php,css,scss,sass EmmetInstall

" Expand emmet abbreviation or jump to next placeholder
function! s:EmmetExpandOrJump()
  if (match(getline('.'), '<.*>')) >= 0
    return "\<plug>(emmet-move-next)"
  endif
  return "\<plug>(emmet-expand-abbr)"
endfunction

" Expand abbreviation or jump to next placeholder
au dotemmet FileType html,html.twig,php,css,scss,sass imap <buffer><expr><silent> <C-k> <sid>EmmetExpandOrJump()
