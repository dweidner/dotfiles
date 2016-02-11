" plugin/emmet.plugin.vim

" Avoid loading emmet globally
let g:user_emmet_install_global = 0

augroup vimrc_emmet

  au!

  " Load emmet plugin for specific file types
  au FileType html,html.twig,php,css,scss,sass EmmetInstall

augroup END
