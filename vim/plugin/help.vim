" plugin/help.vim

augroup vimrc_help

  au!

  " Close help window with <q>
  au FileType help nn <silent><buffer> q :q<CR>
  au FileType help nn <silent><buffer> Q :q<CR>

augroup END
